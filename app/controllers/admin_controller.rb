require 'nokogiri'
class AdminController < ApplicationController
  skip_before_filter  :verify_authenticity_token
  def home
    
  end

  def index

  end

  def national_dashboard
    observations = Observation.all
    obs_dates = observations.collect{|o|o.obs_date.to_date}.uniq.sort.reverse
    latest_obs_dates = []
    0.upto(4) do |i|
      latest_obs_dates << obs_dates[i] #We are only interested in the five latest days
    end
    @latest_obs_dates = latest_obs_dates.collect{|d|d.strftime('%d/%b/%y')}
    diagnosis_categories = ["IDSR_DZ", "NCD", "SG_GI", "SG_LGI", "SG_UGI",
      "SG_RI", "SG_LRI", "SG_URI", "SG_FEVER"]
    @idsr_dz = []; @ncd = []; @sg_gi = []; @sg_lgi = []; @sg_ugi = []
    @sg_ri = []; @sg_lri = []; @sg_uri = []; @sg_fever = []

    latest_obs_dates.each do |obs_date|
      idsr_dz_obs = Observation.by_obs_date_and_diagnosis_category.keys([["#{obs_date}", "IDSR_DZ"]])
      @idsr_dz << idsr_dz_obs.all.count
      ncd_obs = Observation.by_obs_date_and_diagnosis_category.keys([["#{obs_date}", "NCD"]])
      @ncd << ncd_obs.all.count
      sg_gi_obs = Observation.by_obs_date_and_diagnosis_category.keys([["#{obs_date}", "SG_GI"]])
      @sg_gi << sg_gi_obs.all.count
      sg_lgi_obs = Observation.by_obs_date_and_diagnosis_category.keys([["#{obs_date}", "SG_LGI"]])
      @sg_lgi << sg_lgi_obs.all.count
      sg_ugi_obs = Observation.by_obs_date_and_diagnosis_category.keys([["#{obs_date}", "SG_UGI"]])
      @sg_ugi << sg_ugi_obs.all.count
      sg_ri_obs = Observation.by_obs_date_and_diagnosis_category.keys([["#{obs_date}", "SG_RI"]])
      @sg_ri << sg_ri_obs.all.count
      sg_lri_obs = Observation.by_obs_date_and_diagnosis_category.keys([["#{obs_date}", "SG_LRI"]])
      @sg_lri << sg_lri_obs.all.count
      sg_uri_obs = Observation.by_obs_date_and_diagnosis_category.keys([["#{obs_date}", "SG_URI"]])
      @sg_uri << sg_uri_obs.all.count
      sg_fever_obs = Observation.by_obs_date_and_diagnosis_category.keys([["#{obs_date}", "SG_FEVER"]])
      @sg_fever << sg_fever_obs.all.count
    end

    hash = {}
    observations.each do |observation|
      diagnosis_name = observation.diagnosis_full_name
      hash[diagnosis_name] = 0 if hash[diagnosis_name].blank?
      hash[diagnosis_name] += 1
    end
    @data = hash.to_a.in_groups_of(3)
  end

  def regional_dashboard

  end

  def district_dashboard

  end

  def northern_zone
    observations = Observation.all
    obs_dates = observations.collect{|o|o.obs_date.to_date}.uniq.sort.reverse
    latest_obs_dates = []
    0.upto(4) do |i|
      latest_obs_dates << obs_dates[i] #We are only interested in the five latest days
    end
    @latest_obs_dates = latest_obs_dates.collect{|d|d.strftime('%d/%b/%y')}
    diagnosis_categories = ["IDSR_DZ", "NCD", "SG_GI", "SG_LGI", "SG_UGI",
      "SG_RI", "SG_LRI", "SG_URI", "SG_FEVER"]
    @idsr_dz = []; @ncd = []; @sg_gi = []; @sg_lgi = []; @sg_ugi = []
    @sg_ri = []; @sg_lri = []; @sg_uri = []; @sg_fever = []

    latest_obs_dates.each do |obs_date|
      idsr_dz_obs = Observation.by_obs_date_and_diagnosis_category.keys([["#{obs_date}", "IDSR_DZ"]])
      @idsr_dz << idsr_dz_obs.all.count
      ncd_obs = Observation.by_obs_date_and_diagnosis_category.keys([["#{obs_date}", "NCD"]])
      @ncd << ncd_obs.all.count
      sg_gi_obs = Observation.by_obs_date_and_diagnosis_category.keys([["#{obs_date}", "SG_GI"]])
      @sg_gi << sg_gi_obs.all.count
      sg_lgi_obs = Observation.by_obs_date_and_diagnosis_category.keys([["#{obs_date}", "SG_LGI"]])
      @sg_lgi << sg_lgi_obs.all.count
      sg_ugi_obs = Observation.by_obs_date_and_diagnosis_category.keys([["#{obs_date}", "SG_UGI"]])
      @sg_ugi << sg_ugi_obs.all.count
      sg_ri_obs = Observation.by_obs_date_and_diagnosis_category.keys([["#{obs_date}", "SG_RI"]])
      @sg_ri << sg_ri_obs.all.count
      sg_lri_obs = Observation.by_obs_date_and_diagnosis_category.keys([["#{obs_date}", "SG_LRI"]])
      @sg_lri << sg_lri_obs.all.count
      sg_uri_obs = Observation.by_obs_date_and_diagnosis_category.keys([["#{obs_date}", "SG_URI"]])
      @sg_uri << sg_uri_obs.all.count
      sg_fever_obs = Observation.by_obs_date_and_diagnosis_category.keys([["#{obs_date}", "SG_FEVER"]])
      @sg_fever << sg_fever_obs.all.count
    end

    hash = {}
    observations.each do |observation|
      diagnosis_name = observation.diagnosis_full_name
      hash[diagnosis_name] = 0 if hash[diagnosis_name].blank?
      hash[diagnosis_name] += 1
    end
    @data = hash.to_a.in_groups_of(3)
  end

  def central_zone

  end

  def southern_zone

  end

  def zone_central_east
    observations = Observation.all
    obs_dates = observations.collect{|o|o.obs_date.to_date}.uniq.sort.reverse
    latest_obs_dates = []
    0.upto(4) do |i|
      latest_obs_dates << obs_dates[i] #We are only interested in the five latest days
    end
    @latest_obs_dates = latest_obs_dates.collect{|d|d.strftime('%d/%b/%y')}
    diagnosis_categories = ["IDSR_DZ", "NCD", "SG_GI", "SG_LGI", "SG_UGI",
      "SG_RI", "SG_LRI", "SG_URI", "SG_FEVER"]
    @idsr_dz = []; @ncd = []; @sg_gi = []; @sg_lgi = []; @sg_ugi = []
    @sg_ri = []; @sg_lri = []; @sg_uri = []; @sg_fever = []

    latest_obs_dates.each do |obs_date|
      idsr_dz_obs = Observation.by_obs_date_and_diagnosis_category.keys([["#{obs_date}", "IDSR_DZ"]])
      @idsr_dz << idsr_dz_obs.all.count
      ncd_obs = Observation.by_obs_date_and_diagnosis_category.keys([["#{obs_date}", "NCD"]])
      @ncd << ncd_obs.all.count
      sg_gi_obs = Observation.by_obs_date_and_diagnosis_category.keys([["#{obs_date}", "SG_GI"]])
      @sg_gi << sg_gi_obs.all.count
      sg_lgi_obs = Observation.by_obs_date_and_diagnosis_category.keys([["#{obs_date}", "SG_LGI"]])
      @sg_lgi << sg_lgi_obs.all.count
      sg_ugi_obs = Observation.by_obs_date_and_diagnosis_category.keys([["#{obs_date}", "SG_UGI"]])
      @sg_ugi << sg_ugi_obs.all.count
      sg_ri_obs = Observation.by_obs_date_and_diagnosis_category.keys([["#{obs_date}", "SG_RI"]])
      @sg_ri << sg_ri_obs.all.count
      sg_lri_obs = Observation.by_obs_date_and_diagnosis_category.keys([["#{obs_date}", "SG_LRI"]])
      @sg_lri << sg_lri_obs.all.count
      sg_uri_obs = Observation.by_obs_date_and_diagnosis_category.keys([["#{obs_date}", "SG_URI"]])
      @sg_uri << sg_uri_obs.all.count
      sg_fever_obs = Observation.by_obs_date_and_diagnosis_category.keys([["#{obs_date}", "SG_FEVER"]])
      @sg_fever << sg_fever_obs.all.count
    end

    hash = {}
    observations.each do |observation|
      diagnosis_name = observation.diagnosis_full_name
      hash[diagnosis_name] = 0 if hash[diagnosis_name].blank?
      hash[diagnosis_name] += 1
    end
    @data = hash.to_a.in_groups_of(3)
  end

  def zone_central_west
    observations = Observation.all
    obs_dates = observations.collect{|o|o.obs_date.to_date}.uniq.sort.reverse
    latest_obs_dates = []
    0.upto(4) do |i|
      latest_obs_dates << obs_dates[i] #We are only interested in the five latest days
    end
    @latest_obs_dates = latest_obs_dates.collect{|d|d.strftime('%d/%b/%y')}
    diagnosis_categories = ["IDSR_DZ", "NCD", "SG_GI", "SG_LGI", "SG_UGI",
      "SG_RI", "SG_LRI", "SG_URI", "SG_FEVER"]
    @idsr_dz = []; @ncd = []; @sg_gi = []; @sg_lgi = []; @sg_ugi = []
    @sg_ri = []; @sg_lri = []; @sg_uri = []; @sg_fever = []

    latest_obs_dates.each do |obs_date|
      idsr_dz_obs = Observation.by_obs_date_and_diagnosis_category.keys([["#{obs_date}", "IDSR_DZ"]])
      @idsr_dz << idsr_dz_obs.all.count
      ncd_obs = Observation.by_obs_date_and_diagnosis_category.keys([["#{obs_date}", "NCD"]])
      @ncd << ncd_obs.all.count
      sg_gi_obs = Observation.by_obs_date_and_diagnosis_category.keys([["#{obs_date}", "SG_GI"]])
      @sg_gi << sg_gi_obs.all.count
      sg_lgi_obs = Observation.by_obs_date_and_diagnosis_category.keys([["#{obs_date}", "SG_LGI"]])
      @sg_lgi << sg_lgi_obs.all.count
      sg_ugi_obs = Observation.by_obs_date_and_diagnosis_category.keys([["#{obs_date}", "SG_UGI"]])
      @sg_ugi << sg_ugi_obs.all.count
      sg_ri_obs = Observation.by_obs_date_and_diagnosis_category.keys([["#{obs_date}", "SG_RI"]])
      @sg_ri << sg_ri_obs.all.count
      sg_lri_obs = Observation.by_obs_date_and_diagnosis_category.keys([["#{obs_date}", "SG_LRI"]])
      @sg_lri << sg_lri_obs.all.count
      sg_uri_obs = Observation.by_obs_date_and_diagnosis_category.keys([["#{obs_date}", "SG_URI"]])
      @sg_uri << sg_uri_obs.all.count
      sg_fever_obs = Observation.by_obs_date_and_diagnosis_category.keys([["#{obs_date}", "SG_FEVER"]])
      @sg_fever << sg_fever_obs.all.count
    end

    hash = {}
    observations.each do |observation|
      diagnosis_name = observation.diagnosis_full_name
      hash[diagnosis_name] = 0 if hash[diagnosis_name].blank?
      hash[diagnosis_name] += 1
    end
    @data = hash.to_a.in_groups_of(3)
  end

  def zone_south_east
    observations = Observation.all
    obs_dates = observations.collect{|o|o.obs_date.to_date}.uniq.sort.reverse
    latest_obs_dates = []
    0.upto(4) do |i|
      latest_obs_dates << obs_dates[i] #We are only interested in the five latest days
    end
    @latest_obs_dates = latest_obs_dates.collect{|d|d.strftime('%d/%b/%y')}
    diagnosis_categories = ["IDSR_DZ", "NCD", "SG_GI", "SG_LGI", "SG_UGI",
      "SG_RI", "SG_LRI", "SG_URI", "SG_FEVER"]
    @idsr_dz = []; @ncd = []; @sg_gi = []; @sg_lgi = []; @sg_ugi = []
    @sg_ri = []; @sg_lri = []; @sg_uri = []; @sg_fever = []

    latest_obs_dates.each do |obs_date|
      idsr_dz_obs = Observation.by_obs_date_and_diagnosis_category.keys([["#{obs_date}", "IDSR_DZ"]])
      @idsr_dz << idsr_dz_obs.all.count
      ncd_obs = Observation.by_obs_date_and_diagnosis_category.keys([["#{obs_date}", "NCD"]])
      @ncd << ncd_obs.all.count
      sg_gi_obs = Observation.by_obs_date_and_diagnosis_category.keys([["#{obs_date}", "SG_GI"]])
      @sg_gi << sg_gi_obs.all.count
      sg_lgi_obs = Observation.by_obs_date_and_diagnosis_category.keys([["#{obs_date}", "SG_LGI"]])
      @sg_lgi << sg_lgi_obs.all.count
      sg_ugi_obs = Observation.by_obs_date_and_diagnosis_category.keys([["#{obs_date}", "SG_UGI"]])
      @sg_ugi << sg_ugi_obs.all.count
      sg_ri_obs = Observation.by_obs_date_and_diagnosis_category.keys([["#{obs_date}", "SG_RI"]])
      @sg_ri << sg_ri_obs.all.count
      sg_lri_obs = Observation.by_obs_date_and_diagnosis_category.keys([["#{obs_date}", "SG_LRI"]])
      @sg_lri << sg_lri_obs.all.count
      sg_uri_obs = Observation.by_obs_date_and_diagnosis_category.keys([["#{obs_date}", "SG_URI"]])
      @sg_uri << sg_uri_obs.all.count
      sg_fever_obs = Observation.by_obs_date_and_diagnosis_category.keys([["#{obs_date}", "SG_FEVER"]])
      @sg_fever << sg_fever_obs.all.count
    end

    hash = {}
    observations.each do |observation|
      diagnosis_name = observation.diagnosis_full_name
      hash[diagnosis_name] = 0 if hash[diagnosis_name].blank?
      hash[diagnosis_name] += 1
    end
    @data = hash.to_a.in_groups_of(3)
  end

  def zone_south_west
    observations = Observation.all
    obs_dates = observations.collect{|o|o.obs_date.to_date}.uniq.sort.reverse
    latest_obs_dates = []
    0.upto(4) do |i|
      latest_obs_dates << obs_dates[i] #We are only interested in the five latest days
    end
    @latest_obs_dates = latest_obs_dates.collect{|d|d.strftime('%d/%b/%y')}
    diagnosis_categories = ["IDSR_DZ", "NCD", "SG_GI", "SG_LGI", "SG_UGI",
      "SG_RI", "SG_LRI", "SG_URI", "SG_FEVER"]
    @idsr_dz = []; @ncd = []; @sg_gi = []; @sg_lgi = []; @sg_ugi = []
    @sg_ri = []; @sg_lri = []; @sg_uri = []; @sg_fever = []

    latest_obs_dates.each do |obs_date|
      idsr_dz_obs = Observation.by_obs_date_and_diagnosis_category.keys([["#{obs_date}", "IDSR_DZ"]])
      @idsr_dz << idsr_dz_obs.all.count
      ncd_obs = Observation.by_obs_date_and_diagnosis_category.keys([["#{obs_date}", "NCD"]])
      @ncd << ncd_obs.all.count
      sg_gi_obs = Observation.by_obs_date_and_diagnosis_category.keys([["#{obs_date}", "SG_GI"]])
      @sg_gi << sg_gi_obs.all.count
      sg_lgi_obs = Observation.by_obs_date_and_diagnosis_category.keys([["#{obs_date}", "SG_LGI"]])
      @sg_lgi << sg_lgi_obs.all.count
      sg_ugi_obs = Observation.by_obs_date_and_diagnosis_category.keys([["#{obs_date}", "SG_UGI"]])
      @sg_ugi << sg_ugi_obs.all.count
      sg_ri_obs = Observation.by_obs_date_and_diagnosis_category.keys([["#{obs_date}", "SG_RI"]])
      @sg_ri << sg_ri_obs.all.count
      sg_lri_obs = Observation.by_obs_date_and_diagnosis_category.keys([["#{obs_date}", "SG_LRI"]])
      @sg_lri << sg_lri_obs.all.count
      sg_uri_obs = Observation.by_obs_date_and_diagnosis_category.keys([["#{obs_date}", "SG_URI"]])
      @sg_uri << sg_uri_obs.all.count
      sg_fever_obs = Observation.by_obs_date_and_diagnosis_category.keys([["#{obs_date}", "SG_FEVER"]])
      @sg_fever << sg_fever_obs.all.count
    end

    hash = {}
    observations.each do |observation|
      diagnosis_name = observation.diagnosis_full_name
      hash[diagnosis_name] = 0 if hash[diagnosis_name].blank?
      hash[diagnosis_name] += 1
    end
    @data = hash.to_a.in_groups_of(3)
  end

  def diagnosis_settings_menu

  end

  def add_diagnosis

  end

  def remove_diagnosis
    
  end

  def view_diagnoses

  end

  def feed
    render :template => '/admin/feed.rss.builder', :layout => false
  end

  def pull_opd_diagnoses
    remote_app_address = Settings["opd.address"]
    uri = "http://#{remote_app_address}/location/disease_surveillance_api"
    last_obs_date = Observation.last.obs_date rescue nil
    start_date = params[:start_date]
    end_date = params[:end_date]
    
    if last_obs_date.blank?
      start_date = '1-Jan-2000'.to_date
    else
      start_date = last_obs_date.to_date + 1.day
    end if params[:start_date].blank?
    
    end_date = Date.today if params[:end_date].blank?
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
      obs = Observation.create({
          :national_id => national_id,
          :gender => gender,
          :age => age,
          :diagnosis_short_name => diagnosis_short_name,
          :diagnosis_full_name => diagnosis_full_name,
          :facility => facility,
          :obs_date => obs_date
        })
      diagnosis_categories = DiagnosisCategory.by_full_name(:key => diagnosis_full_name).all.map(&:category).uniq
      update_obs_diagnosis_category(obs, diagnosis_categories)
    end
    render :text => 'Done' and return
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
            :obs_date => obs.obs_date
          })
      end
      count = count + 1
    end
  end
  
  def concept_groups
    
  end

  def observations_by_diagnosis
    diagnosis_obs = Observation.by_diagnosis_full_name(:key => params[:diagnosis]).all
    patient_data = {}
    count = 1
    diagnosis_obs.each do |obs|
      patient_data[count] = {}
      patient_data[count]["national_id"] = obs.national_id
      patient_data[count]["gender"] = obs.gender
      patient_data[count]["age"] = obs.age
      patient_data[count]["obs_date"] = obs.obs_date.to_date.strftime("%d/%b/%Y")
      count = count + 1
    end
    render :text => patient_data.to_json.html_safe and return
  end
  
end
