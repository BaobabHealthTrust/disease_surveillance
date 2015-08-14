
START_DATE = Date.today
END_DATE = Date.today

def pull_opd_diagnoses
  remote_app_address = Settings["opd.address"]
  uri = "http://#{remote_app_address}/location/disease_surveillance_api"
  start_date = START_DATE
  end_date = END_DATE

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