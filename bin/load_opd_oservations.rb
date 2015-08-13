dates = ARGV[0].split(' ') #split by space
START_DATE = dates[0].to_date rescue 'invalid date'
END_DATE = dates[1].to_date rescue 'invalid date'
unless dates.length == 2
  puts "Dude, not the right number of arguments."
  puts "Usage: rails runner bin/load_opd_oservations.rb 'start_date end_date'\n"
  exit
end

if (START_DATE == 'invalid date' || END_DATE == 'invalid date')
  puts "Invalid date detected."
  puts "Usage: rails runner bin/load_opd_oservations.rb 'start_date end_date'\n"
  exit
end

if (START_DATE > END_DATE)
  puts "Start Date is greater than End Date"
  puts "Usage: rails runner bin/load_opd_oservations.rb 'start_date end_date'\n"
  exit
end

def pull_opd_diagnoses
  remote_app_address = Settings["opd.address"]
  uri = "http://#{remote_app_address}/location/disease_surveillance_api"
  last_obs_date = Observation.last.obs_date rescue nil
  start_date = START_DATE
  end_date = END_DATE
=begin
  if last_obs_date.blank?
    start_date = '1-Jan-2000'.to_date
  else
    start_date = last_obs_date.to_date + 1.day
  end if params[:start_date].blank?

  end_date = Date.today if params[:end_date].blank?
=end
  date_params =  {
    "start_date" => start_date,
    "end_date" => end_date
  }

  diagnoses = RestClient.post(uri, date_params) rescue []
  remote_result = JSON.parse(diagnoses) rescue []

  remote_result.each do |key, values|
    national_id = values["national_id"]
    gender = values["gender"]
    age = values["age"]
    diagnosis_short_name = values["diagnosis_short_name"]
    diagnosis_full_name = values["diagnosis_full_name"]
    obs_date = values["obs_date"]
    facility = values["facility"]
    obs_id = values["obs_id"]
    zone = values["zone"]

    obs_exists = Observation.by_obs_id_and_facility.keys([[obs_id, "#{facility}"]]).all
    next unless obs_exists.blank? #The observation was already created and it should be skipped
    obs = Observation.create({
        :national_id => national_id,
        :gender => gender,
        :age => age,
        :diagnosis_short_name => diagnosis_short_name,
        :diagnosis_full_name => diagnosis_full_name,
        :facility => facility,
        :obs_date => obs_date,
        :obs_id => obs_id,
        :zone => zone
      })
    diagnosis_categories = DiagnosisCategory.by_full_name(:key => diagnosis_full_name).all.map(&:category).uniq
    update_obs_diagnosis_category(obs, diagnosis_categories)
  end

end

def update_obs_diagnosis_category(obs, diagnosis_categories)
  count = 0
  (diagnosis_categories || []).each do |category|
    if (count == 0)
      obs.update_attributes({:diagnosis_category => category})
    else
      Observation.create({
          :national_id => obs.national_id,
          :gender => obs.gender,
          :age => obs.age,
          :diagnosis_short_name => obs.diagnosis_short_name,
          :diagnosis_full_name => obs.diagnosis_full_name,
          :diagnosis_category => category,
          :facility => obs.facility,
          :obs_date => obs.obs_date,
          :obs_id => obs.obs_id,
          :zone => obs.zone
        })
    end
    count = count + 1
  end
end

pull_opd_diagnoses