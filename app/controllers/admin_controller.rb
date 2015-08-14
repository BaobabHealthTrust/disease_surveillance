require 'nokogiri'
class AdminController < ApplicationController
  skip_before_filter  :verify_authenticity_token
  def home
    
  end

  def index

  end

  def national_dashboard
    obs_dates = []
    start_date = '28/March/2012'.to_date
    1.upto(21){|i|
      obs_dates << start_date - i.days
    }
    latest_obs_dates = obs_dates
    @latest_obs_dates = latest_obs_dates.reverse.collect{|d|d.strftime('%d/%b/%Y') rescue '??'}#Old date first
    diagnosis_categories = ["IDSR_DZ", "NCD", "SG_GI", "SG_LGI", "SG_UGI",
      "SG_RI", "SG_LRI", "SG_URI", "SG_FEVER"]
    @idsr_dz = []; @ncd = []; @sg_gi = []; @sg_lgi = []; @sg_ugi = []
    @sg_ri = []; @sg_lri = []; @sg_uri = []; @sg_fever = []

    latest_obs_dates.reverse.each do |obs_date|
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
    #observations.each do |observation|
    #diagnosis_name = observation.diagnosis_full_name
    # hash[diagnosis_name] = 0 if hash[diagnosis_name].blank?
    # hash[diagnosis_name] += 1
    #end
    #@data = hash.to_a.in_groups_of(3)
  end

  def regional_dashboard

  end

  def district_dashboard

  end

  def northern_zone
    obs_dates = []
    start_date = '28/March/2012'.to_date
    1.upto(21){|i|
      obs_dates << start_date - i.days
    }
    latest_obs_dates = obs_dates
    @latest_obs_dates = latest_obs_dates.reverse.collect{|d|d.strftime('%d/%b/%Y') rescue '??'}
    diagnosis_categories = ["IDSR_DZ", "NCD", "SG_GI", "SG_LGI", "SG_UGI",
      "SG_RI", "SG_LRI", "SG_URI", "SG_FEVER"]
    @idsr_dz = []; @ncd = []; @sg_gi = []; @sg_lgi = []; @sg_ugi = []
    @sg_ri = []; @sg_lri = []; @sg_uri = []; @sg_fever = []

    latest_obs_dates.reverse.each do |obs_date|
      idsr_dz_obs = Observation.by_obs_date_and_diagnosis_category_and_zone.keys([["#{obs_date}", "IDSR_DZ", "zone_northern"]])
      @idsr_dz << idsr_dz_obs.all.count
      ncd_obs = Observation.by_obs_date_and_diagnosis_category_and_zone.keys([["#{obs_date}", "NCD", "zone_northern"]])
      @ncd << ncd_obs.all.count
      sg_gi_obs = Observation.by_obs_date_and_diagnosis_category_and_zone.keys([["#{obs_date}", "SG_GI", "zone_northern"]])
      @sg_gi << sg_gi_obs.all.count
      sg_lgi_obs = Observation.by_obs_date_and_diagnosis_category_and_zone.keys([["#{obs_date}", "SG_LGI", "zone_northern"]])
      @sg_lgi << sg_lgi_obs.all.count
      sg_ugi_obs = Observation.by_obs_date_and_diagnosis_category_and_zone.keys([["#{obs_date}", "SG_UGI", "zone_northern"]])
      @sg_ugi << sg_ugi_obs.all.count
      sg_ri_obs = Observation.by_obs_date_and_diagnosis_category_and_zone.keys([["#{obs_date}", "SG_RI", "zone_northern"]])
      @sg_ri << sg_ri_obs.all.count
      sg_lri_obs = Observation.by_obs_date_and_diagnosis_category_and_zone.keys([["#{obs_date}", "SG_LRI", "zone_northern"]])
      @sg_lri << sg_lri_obs.all.count
      sg_uri_obs = Observation.by_obs_date_and_diagnosis_category_and_zone.keys([["#{obs_date}", "SG_URI", "zone_northern"]])
      @sg_uri << sg_uri_obs.all.count
      sg_fever_obs = Observation.by_obs_date_and_diagnosis_category_and_zone.keys([["#{obs_date}", "SG_FEVER", "zone_northern"]])
      @sg_fever << sg_fever_obs.all.count
    end

    hash = {}
  end

  def central_zone

  end

  def southern_zone

  end

  def zone_central_east
    obs_dates = []
    start_date = '28/March/2012'.to_date
    1.upto(21){|i|
      obs_dates << start_date - i.days
    }
    latest_obs_dates = obs_dates
    @latest_obs_dates = latest_obs_dates.reverse.collect{|d|d.strftime('%d/%b/%Y') rescue '??'}
    diagnosis_categories = ["IDSR_DZ", "NCD", "SG_GI", "SG_LGI", "SG_UGI",
      "SG_RI", "SG_LRI", "SG_URI", "SG_FEVER"]
    @idsr_dz = []; @ncd = []; @sg_gi = []; @sg_lgi = []; @sg_ugi = []
    @sg_ri = []; @sg_lri = []; @sg_uri = []; @sg_fever = []

    latest_obs_dates.reverse.each do |obs_date|
      idsr_dz_obs = Observation.by_obs_date_and_diagnosis_category_and_zone.keys([["#{obs_date}", "IDSR_DZ", "zone_c_east"]])
      @idsr_dz << idsr_dz_obs.all.count
      ncd_obs = Observation.by_obs_date_and_diagnosis_category_and_zone.keys([["#{obs_date}", "NCD", "zone_c_east"]])
      @ncd << ncd_obs.all.count
      sg_gi_obs = Observation.by_obs_date_and_diagnosis_category_and_zone.keys([["#{obs_date}", "SG_GI", "zone_c_east"]])
      @sg_gi << sg_gi_obs.all.count
      sg_lgi_obs = Observation.by_obs_date_and_diagnosis_category_and_zone.keys([["#{obs_date}", "SG_LGI", "zone_c_east"]])
      @sg_lgi << sg_lgi_obs.all.count
      sg_ugi_obs = Observation.by_obs_date_and_diagnosis_category_and_zone.keys([["#{obs_date}", "SG_UGI", "zone_c_east"]])
      @sg_ugi << sg_ugi_obs.all.count
      sg_ri_obs = Observation.by_obs_date_and_diagnosis_category_and_zone.keys([["#{obs_date}", "SG_RI", "zone_c_east"]])
      @sg_ri << sg_ri_obs.all.count
      sg_lri_obs = Observation.by_obs_date_and_diagnosis_category_and_zone.keys([["#{obs_date}", "SG_LRI", "zone_c_east"]])
      @sg_lri << sg_lri_obs.all.count
      sg_uri_obs = Observation.by_obs_date_and_diagnosis_category_and_zone.keys([["#{obs_date}", "SG_URI", "zone_c_east"]])
      @sg_uri << sg_uri_obs.all.count
      sg_fever_obs = Observation.by_obs_date_and_diagnosis_category_and_zone.keys([["#{obs_date}", "SG_FEVER", "zone_c_east"]])
      @sg_fever << sg_fever_obs.all.count
    end

    hash = {}
  end

  def zone_central_west
    obs_dates = []
    start_date = '28/March/2012'.to_date
    1.upto(21){|i|
      obs_dates << start_date - i.days
    }
    latest_obs_dates = obs_dates
    @latest_obs_dates = latest_obs_dates.reverse.collect{|d|d.strftime('%d/%b/%Y') rescue '??'}
    diagnosis_categories = ["IDSR_DZ", "NCD", "SG_GI", "SG_LGI", "SG_UGI",
      "SG_RI", "SG_LRI", "SG_URI", "SG_FEVER"]
    @idsr_dz = []; @ncd = []; @sg_gi = []; @sg_lgi = []; @sg_ugi = []
    @sg_ri = []; @sg_lri = []; @sg_uri = []; @sg_fever = []

    latest_obs_dates.reverse.each do |obs_date|
      idsr_dz_obs = Observation.by_obs_date_and_diagnosis_category_and_zone.keys([["#{obs_date}", "IDSR_DZ", "zone_c_west"]])
      @idsr_dz << idsr_dz_obs.all.count
      ncd_obs = Observation.by_obs_date_and_diagnosis_category_and_zone.keys([["#{obs_date}", "NCD", "zone_c_west"]])
      @ncd << ncd_obs.all.count
      sg_gi_obs = Observation.by_obs_date_and_diagnosis_category_and_zone.keys([["#{obs_date}", "SG_GI", "zone_c_west"]])
      @sg_gi << sg_gi_obs.all.count
      sg_lgi_obs = Observation.by_obs_date_and_diagnosis_category_and_zone.keys([["#{obs_date}", "SG_LGI", "zone_c_west"]])
      @sg_lgi << sg_lgi_obs.all.count
      sg_ugi_obs = Observation.by_obs_date_and_diagnosis_category_and_zone.keys([["#{obs_date}", "SG_UGI", "zone_c_west"]])
      @sg_ugi << sg_ugi_obs.all.count
      sg_ri_obs = Observation.by_obs_date_and_diagnosis_category_and_zone.keys([["#{obs_date}", "SG_RI", "zone_c_west"]])
      @sg_ri << sg_ri_obs.all.count
      sg_lri_obs = Observation.by_obs_date_and_diagnosis_category_and_zone.keys([["#{obs_date}", "SG_LRI", "zone_c_west"]])
      @sg_lri << sg_lri_obs.all.count
      sg_uri_obs = Observation.by_obs_date_and_diagnosis_category_and_zone.keys([["#{obs_date}", "SG_URI", "zone_c_west"]])
      @sg_uri << sg_uri_obs.all.count
      sg_fever_obs = Observation.by_obs_date_and_diagnosis_category_and_zone.keys([["#{obs_date}", "SG_FEVER", "zone_c_west"]])
      @sg_fever << sg_fever_obs.all.count
    end

    hash = {}

  end

  def zone_south_east
    obs_dates = []
    start_date = '28/March/2012'.to_date
    1.upto(21){|i|
      obs_dates << start_date - i.days
    }
    latest_obs_dates = obs_dates
    @latest_obs_dates = latest_obs_dates.reverse.collect{|d|d.strftime('%d/%b/%Y') rescue '??'}
    diagnosis_categories = ["IDSR_DZ", "NCD", "SG_GI", "SG_LGI", "SG_UGI",
      "SG_RI", "SG_LRI", "SG_URI", "SG_FEVER"]
    @idsr_dz = []; @ncd = []; @sg_gi = []; @sg_lgi = []; @sg_ugi = []
    @sg_ri = []; @sg_lri = []; @sg_uri = []; @sg_fever = []

    latest_obs_dates.reverse.each do |obs_date|
      idsr_dz_obs = Observation.by_obs_date_and_diagnosis_category_and_zone.keys([["#{obs_date}", "IDSR_DZ", "zone_s_east"]])
      @idsr_dz << idsr_dz_obs.all.count
      ncd_obs = Observation.by_obs_date_and_diagnosis_category_and_zone.keys([["#{obs_date}", "NCD", "zone_s_east"]])
      @ncd << ncd_obs.all.count
      sg_gi_obs = Observation.by_obs_date_and_diagnosis_category_and_zone.keys([["#{obs_date}", "SG_GI", "zone_s_east"]])
      @sg_gi << sg_gi_obs.all.count
      sg_lgi_obs = Observation.by_obs_date_and_diagnosis_category_and_zone.keys([["#{obs_date}", "SG_LGI", "zone_s_east"]])
      @sg_lgi << sg_lgi_obs.all.count
      sg_ugi_obs = Observation.by_obs_date_and_diagnosis_category_and_zone.keys([["#{obs_date}", "SG_UGI", "zone_s_east"]])
      @sg_ugi << sg_ugi_obs.all.count
      sg_ri_obs = Observation.by_obs_date_and_diagnosis_category_and_zone.keys([["#{obs_date}", "SG_RI", "zone_s_east"]])
      @sg_ri << sg_ri_obs.all.count
      sg_lri_obs = Observation.by_obs_date_and_diagnosis_category_and_zone.keys([["#{obs_date}", "SG_LRI", "zone_s_east"]])
      @sg_lri << sg_lri_obs.all.count
      sg_uri_obs = Observation.by_obs_date_and_diagnosis_category_and_zone.keys([["#{obs_date}", "SG_URI", "zone_s_east"]])
      @sg_uri << sg_uri_obs.all.count
      sg_fever_obs = Observation.by_obs_date_and_diagnosis_category_and_zone.keys([["#{obs_date}", "SG_FEVER", "zone_s_east"]])
      @sg_fever << sg_fever_obs.all.count
    end

    hash = {}
  end

  def zone_south_west
    obs_dates = []
    start_date = '28/March/2012'.to_date
    1.upto(21){|i|
      obs_dates << start_date - i.days
    }
    latest_obs_dates = obs_dates
    @latest_obs_dates = latest_obs_dates.reverse.collect{|d|d.strftime('%d/%b/%Y') rescue '??'}
    diagnosis_categories = ["IDSR_DZ", "NCD", "SG_GI", "SG_LGI", "SG_UGI",
      "SG_RI", "SG_LRI", "SG_URI", "SG_FEVER"]
    @idsr_dz = []; @ncd = []; @sg_gi = []; @sg_lgi = []; @sg_ugi = []
    @sg_ri = []; @sg_lri = []; @sg_uri = []; @sg_fever = []

    latest_obs_dates.reverse.each do |obs_date|
      idsr_dz_obs = Observation.by_obs_date_and_diagnosis_category_and_zone.keys([["#{obs_date}", "IDSR_DZ", "zone_s_west"]])
      @idsr_dz << idsr_dz_obs.all.count
      ncd_obs = Observation.by_obs_date_and_diagnosis_category_and_zone.keys([["#{obs_date}", "NCD", "zone_s_west"]])
      @ncd << ncd_obs.all.count
      sg_gi_obs = Observation.by_obs_date_and_diagnosis_category_and_zone.keys([["#{obs_date}", "SG_GI", "zone_s_west"]])
      @sg_gi << sg_gi_obs.all.count
      sg_lgi_obs = Observation.by_obs_date_and_diagnosis_category_and_zone.keys([["#{obs_date}", "SG_LGI", "zone_s_west"]])
      @sg_lgi << sg_lgi_obs.all.count
      sg_ugi_obs = Observation.by_obs_date_and_diagnosis_category_and_zone.keys([["#{obs_date}", "SG_UGI", "zone_s_west"]])
      @sg_ugi << sg_ugi_obs.all.count
      sg_ri_obs = Observation.by_obs_date_and_diagnosis_category_and_zone.keys([["#{obs_date}", "SG_RI", "zone_s_west"]])
      @sg_ri << sg_ri_obs.all.count
      sg_lri_obs = Observation.by_obs_date_and_diagnosis_category_and_zone.keys([["#{obs_date}", "SG_LRI", "zone_s_west"]])
      @sg_lri << sg_lri_obs.all.count
      sg_uri_obs = Observation.by_obs_date_and_diagnosis_category_and_zone.keys([["#{obs_date}", "SG_URI", "zone_s_west"]])
      @sg_uri << sg_uri_obs.all.count
      sg_fever_obs = Observation.by_obs_date_and_diagnosis_category_and_zone.keys([["#{obs_date}", "SG_FEVER", "zone_s_west"]])
      @sg_fever << sg_fever_obs.all.count
    end

    hash = {}
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
      obs_id = values["obs_id"]
      
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
          :obs_id => obs_id
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
            :obs_date => obs.obs_date,
            :obs_id => obs.obs_id
          })
      end
      count = count + 1
    end
  end
  
  def concept_groups
    
  end

  def observations_by_diagnosis

    unless (params[:period_type].blank?)
      end_date = params[:date].to_date
      start_date = end_date.beginning_of_month if (params[:period_type] == 'monthly')
      start_date = end_date.beginning_of_week if (params[:period_type] == 'weekly')
      start_date = end_date if (params[:period_type] == 'daily')
      observations = []
      my_observations = Observation.by_obs_date.startkey(start_date.to_date).endkey(end_date.to_date).all
      if (params[:zone].match(/national/i))
        my_observations.each do |observation|
          if (observation.diagnosis_category == params[:category].squish)
            if (observation.diagnosis_full_name == params[:diagnosis].squish)
              observations << observation
            end
          end
        end
      else
        my_observations.each do |observation|
          if (observation.zone == params[:zone].squish)
            if (observation.diagnosis_category == params[:category].squish)
              if (observation.diagnosis_full_name == params[:diagnosis].squish)
                observations << observation
              end
            end
          end
        end
      end
    else #This is on Daily basis Granularity tab not clicked
      if (params[:zone].match(/national/i))
        observations = Observation.by_obs_date_and_diagnosis_category_and_diagnosis_full_name.keys([["#{params[:date].to_date}", "#{params[:category]}", "#{params[:diagnosis]}"]]).all
      else
        observations = Observation.by_obs_date_and_diagnosis_category_and_zone_and_diagnosis_full_name.keys([["#{params[:date].to_date}", "#{params[:category]}", "#{params[:zone]}", "#{params[:diagnosis]}"]]).all
      end
    end
    
    patient_data = {}
    count = 1
    observations.each do |obs|
      patient_data[count] = {}
      patient_data[count]["national_id"] = obs.national_id
      patient_data[count]["gender"] = obs.gender
      patient_data[count]["age"] = obs.age
      patient_data[count]["obs_date"] = obs.obs_date.to_date.strftime("%d/%b/%Y") rescue '??'
      patient_data[count]["facility"] = obs.facility
      count = count + 1
    end
    render :text => patient_data.to_json.html_safe and return
  end

  def diagnosis_summary
    hash = {}
    
    unless (params[:period_type].blank?)
      end_date = params[:date].to_date
      start_date = end_date.beginning_of_month if (params[:period_type] == 'monthly')
      start_date = end_date.beginning_of_week if (params[:period_type] == 'weekly')
      start_date = end_date if (params[:period_type] == 'daily')
      observations = []
      my_observations = Observation.by_obs_date.startkey(start_date.to_date).endkey(end_date.to_date).all
      if (params[:zone].match(/national/i))
        my_observations.each do |observation|
          observations << observation if (observation.diagnosis_category == params[:category].squish)
        end
      else
        my_observations.each do |observation|
          if (observation.zone == params[:zone].squish)
            observations << observation if (observation.diagnosis_category == params[:category].squish)
          end
        end
      end
    else #This is on Daily basis Granularity tab not clicked
      if (params[:zone].match(/national/i))
        observations = Observation.by_obs_date_and_diagnosis_category.keys([["#{params[:date].to_date}", "#{params[:category]}"]]).all
      else
        observations = Observation.by_obs_date_and_diagnosis_category_and_zone.keys([["#{params[:date].to_date}", "#{params[:category]}", "#{params[:zone]}"]]).all
      end
    end
    
    observations.each do |observation|
      diagnosis_name = observation.diagnosis_full_name
      hash[diagnosis_name] = 0 if hash[diagnosis_name].blank?
      hash[diagnosis_name] += 1
    end
    @data = hash.to_a.in_groups_of(3)
  end

  def chart_by_zone_and_period_type_and_syndrome
    zone = params[:zone].squish
    diagnosis_category = params[:diagnosis_category]
    period_type = params[:period_type]
    dates = []
    latest_date = '28 Mar 2013'.to_date#Date.today
    hash = {}
    sg_fever_data = []; sg_uri_data = []; sg_lri_data = []; sg_ri_data = []; sg_ugi_data = [];
    sg_lgi_data = []; sg_gi_data = []; ncd_data = []; idsr_data = [];
    xaxis = []
    
    if(period_type == 'daily')
      start_day = latest_date - 20.days
      days = (start_day..latest_date).map{ |date| date} #21 dates
      days.each do |day|
        start_date = day
        end_date = day
        xaxis << end_date.to_date.strftime("%d/%b/%Y") rescue '??'
        sg_fever_count = 0; sg_uri_count = 0; sg_lri_count = 0; sg_ri_count = 0; sg_ugi_count = 0;
        sg_lgi_count = 0; sg_gi_count = 0; ncd_count = 0; idsr_count = 0;
        observations = Observation.by_obs_date.startkey(start_date.to_date).endkey(end_date.to_date).all
        observations.each do |observation|
          if (params[:zone].match(/national/i))
            if (observation.diagnosis_category == 'SG_FEVER')
              sg_fever_count = sg_fever_count + 1
            end
          else
            if (observation.diagnosis_category == 'SG_FEVER' && observation.zone == zone)
              sg_fever_count = sg_fever_count + 1
            end
          end

          if (params[:zone].match(/national/i))
            if (observation.diagnosis_category == 'SG_URI')
              sg_uri_count = sg_uri_count + 1
            end
          else
            if (observation.diagnosis_category == 'SG_URI' && observation.zone == zone)
              sg_uri_count = sg_uri_count + 1
            end
          end
          
          if (params[:zone].match(/national/i))
            if (observation.diagnosis_category == 'SG_LRI')
              sg_lri_count = sg_lri_count + 1
            end
          else
            if (observation.diagnosis_category == 'SG_LRI' && observation.zone == zone)
              sg_lri_count = sg_lri_count + 1
            end
          end

          if (params[:zone].match(/national/i))
            if (observation.diagnosis_category == 'SG_RI')
              sg_ri_count = sg_ri_count + 1
            end
          else
            if (observation.diagnosis_category == 'SG_RI' && observation.zone == zone)
              sg_ri_count = sg_ri_count + 1
            end
          end

          if (params[:zone].match(/national/i))
            if (observation.diagnosis_category == 'SG_UGI')
              sg_ugi_count = sg_ugi_count + 1
            end
          else
            if (observation.diagnosis_category == 'SG_UGI' && observation.zone == zone)
              sg_ugi_count = sg_ugi_count + 1
            end
          end

          if (params[:zone].match(/national/i))
            if (observation.diagnosis_category == 'SG_LGI')
              sg_lgi_count = sg_lgi_count + 1
            end
          else
            if (observation.diagnosis_category == 'SG_LGI' && observation.zone == zone)
              sg_lgi_count = sg_lgi_count + 1
            end
          end

          if (params[:zone].match(/national/i))
            if (observation.diagnosis_category == 'SG_GI')
              sg_gi_count = sg_gi_count + 1
            end
          else
            if (observation.diagnosis_category == 'SG_GI' && observation.zone == zone)
              sg_gi_count = sg_gi_count + 1
            end
          end

          if (params[:zone].match(/national/i))
            if (observation.diagnosis_category == 'NCD')
              ncd_count = ncd_count + 1
            end
          else
            if (observation.diagnosis_category == 'NCD' && observation.zone == zone)
              ncd_count = ncd_count + 1
            end
          end

          if (params[:zone].match(/national/i))
            if (observation.diagnosis_category == 'IDSR_DZ')
              idsr_count = idsr_count + 1
            end
          else
            if (observation.diagnosis_category == 'IDSR_DZ' && observation.zone == zone)
              idsr_count = idsr_count + 1
            end
          end
        end

        sg_fever_data << sg_fever_count; sg_uri_data << sg_uri_count; sg_lri_data << sg_lri_count;
        sg_ri_data << sg_ri_count; sg_ugi_data << sg_ugi_count; sg_lgi_data << sg_lgi_count;
        sg_gi_data << sg_gi_count; ncd_data << ncd_count; idsr_data << idsr_count;

      end

      hash = {
        "xaxis" => xaxis, "sg_fever_data" => sg_fever_data, "sg_uri_data" => sg_uri_data,
        "sg_lri_data" => sg_lri_data, "sg_ri_data" => sg_ri_data, "sg_ugi_data" => sg_ugi_data,
        "sg_lgi_data" => sg_lgi_data, "sg_gi_data" => sg_gi_data, "ncd_data" => ncd_data,
        "idsr_data" => idsr_data
      }

      render :text => hash.to_json and return
    end
    
    if(period_type == 'weekly')
      weeks = []
      count = 0
      start_week = (latest_date - 4.weeks)
      while  (latest_date > start_week)
        if (count == 0)
          week_beginning = latest_date.beginning_of_week
          week_ending = latest_date
        else
          week_beginning = latest_date.beginning_of_week
          week_ending = latest_date.end_of_week - 1.day
        end
        weeks << [week_beginning, week_ending]
        latest_date = latest_date - 8.days
        count = count + 1
      end

      #["IDSR_DZ", "NCD", "SG_GI", "SG_LGI", "SG_UGI", "SG_RI", "SG_LRI", "SG_URI", "SG_FEVER"]
      
      weeks.reverse.each do |week|
        start_date = week[0]
        end_date = week[1]
        xaxis << end_date.to_date.strftime("%d/%b/%Y") rescue '??'
        sg_fever_count = 0; sg_uri_count = 0; sg_lri_count = 0; sg_ri_count = 0; sg_ugi_count = 0;
        sg_lgi_count = 0; sg_gi_count = 0; ncd_count = 0; idsr_count = 0;
        observations = Observation.by_obs_date.startkey(start_date.to_date).endkey(end_date.to_date).all
        observations.each do |observation|
          if (params[:zone].match(/national/i))
            if (observation.diagnosis_category == 'SG_FEVER')
              sg_fever_count = sg_fever_count + 1
            end
          else
            if (observation.diagnosis_category == 'SG_FEVER' && observation.zone == zone)
              sg_fever_count = sg_fever_count + 1
            end
          end

          if (params[:zone].match(/national/i))
            if (observation.diagnosis_category == 'SG_URI')
              sg_uri_count = sg_uri_count + 1
            end
          else
            if (observation.diagnosis_category == 'SG_URI' && observation.zone == zone)
              sg_uri_count = sg_uri_count + 1
            end
          end

          if (params[:zone].match(/national/i))
            if (observation.diagnosis_category == 'SG_LRI')
              sg_lri_count = sg_lri_count + 1
            end
          else
            if (observation.diagnosis_category == 'SG_LRI' && observation.zone == zone)
              sg_lri_count = sg_lri_count + 1
            end
          end

          if (params[:zone].match(/national/i))
            if (observation.diagnosis_category == 'SG_RI')
              sg_ri_count = sg_ri_count + 1
            end
          else
            if (observation.diagnosis_category == 'SG_RI' && observation.zone == zone)
              sg_ri_count = sg_ri_count + 1
            end
          end

          if (params[:zone].match(/national/i))
            if (observation.diagnosis_category == 'SG_UGI')
              sg_ugi_count = sg_ugi_count + 1
            end
          else
            if (observation.diagnosis_category == 'SG_UGI' && observation.zone == zone)
              sg_ugi_count = sg_ugi_count + 1
            end
          end

          if (params[:zone].match(/national/i))
            if (observation.diagnosis_category == 'SG_LGI')
              sg_lgi_count = sg_lgi_count + 1
            end
          else
            if (observation.diagnosis_category == 'SG_LGI' && observation.zone == zone)
              sg_lgi_count = sg_lgi_count + 1
            end
          end

          if (params[:zone].match(/national/i))
            if (observation.diagnosis_category == 'SG_GI')
              sg_gi_count = sg_gi_count + 1
            end
          else
            if (observation.diagnosis_category == 'SG_GI' && observation.zone == zone)
              sg_gi_count = sg_gi_count + 1
            end
          end

          if (params[:zone].match(/national/i))
            if (observation.diagnosis_category == 'NCD')
              ncd_count = ncd_count + 1
            end
          else
            if (observation.diagnosis_category == 'NCD' && observation.zone == zone)
              ncd_count = ncd_count + 1
            end
          end
          if (params[:zone].match(/national/i))
            if (observation.diagnosis_category == 'IDSR_DZ')
              idsr_count = idsr_count + 1
            end
          else
            if (observation.diagnosis_category == 'IDSR_DZ' && observation.zone == zone)
              idsr_count = idsr_count + 1
            end
          end
        end

        sg_fever_data << sg_fever_count; sg_uri_data << sg_uri_count; sg_lri_data << sg_lri_count;
        sg_ri_data << sg_ri_count; sg_ugi_data << sg_ugi_count; sg_lgi_data << sg_lgi_count;
        sg_gi_data << sg_gi_count; ncd_data << ncd_count; idsr_data << idsr_count;
        
      end

      hash = {
        "xaxis" => xaxis, "sg_fever_data" => sg_fever_data, "sg_uri_data" => sg_uri_data,
        "sg_lri_data" => sg_lri_data, "sg_ri_data" => sg_ri_data, "sg_ugi_data" => sg_ugi_data,
        "sg_lgi_data" => sg_lgi_data, "sg_gi_data" => sg_gi_data, "ncd_data" => ncd_data,
        "idsr_data" => idsr_data
      }

      render :text => hash.to_json and return
    end
    
    if(period_type == 'monthly')
      months = []
      count = 0
      start_month = (latest_date - 4.months)
      while  (latest_date > start_month)
        if (count == 0)
          month_beginning = latest_date.beginning_of_month
          month_ending = latest_date
        else
          month_beginning = latest_date.beginning_of_month
          month_ending = latest_date.end_of_month
        end
        months << [month_beginning, month_ending]
        latest_date = latest_date - latest_date.end_of_month.day.days #e.g 30 days, or 31 days
        count = count + 1
      end

      months.reverse.each do |month|
        start_date = month[0]
        end_date = month[1]
        xaxis << end_date.to_date.strftime("%d/%b/%Y") rescue '??'
        sg_fever_count = 0; sg_uri_count = 0; sg_lri_count = 0; sg_ri_count = 0; sg_ugi_count = 0;
        sg_lgi_count = 0; sg_gi_count = 0; ncd_count = 0; idsr_count = 0;
        observations = Observation.by_obs_date.startkey(start_date.to_date).endkey(end_date.to_date).all
        observations.each do |observation|
          if (params[:zone].match(/national/i))
            if (observation.diagnosis_category == 'SG_FEVER')
              sg_fever_count = sg_fever_count + 1
            end
          else
            if (observation.diagnosis_category == 'SG_FEVER' && observation.zone == zone)
              sg_fever_count = sg_fever_count + 1
            end
          end

          if (params[:zone].match(/national/i))
            if (observation.diagnosis_category == 'SG_URI')
              sg_uri_count = sg_uri_count + 1
            end
          else
            if (observation.diagnosis_category == 'SG_URI' && observation.zone == zone)
              sg_uri_count = sg_uri_count + 1
            end
          end

          if (params[:zone].match(/national/i))
            if (observation.diagnosis_category == 'SG_LRI')
              sg_lri_count = sg_lri_count + 1
            end
          else
            if (observation.diagnosis_category == 'SG_LRI' && observation.zone == zone)
              sg_lri_count = sg_lri_count + 1
            end
          end

          if (params[:zone].match(/national/i))
            if (observation.diagnosis_category == 'SG_RI')
              sg_ri_count = sg_ri_count + 1
            end
          else
            if (observation.diagnosis_category == 'SG_RI' && observation.zone == zone)
              sg_ri_count = sg_ri_count + 1
            end
          end

          if (params[:zone].match(/national/i))
            if (observation.diagnosis_category == 'SG_UGI')
              sg_ugi_count = sg_ugi_count + 1
            end
          else
            if (observation.diagnosis_category == 'SG_UGI' && observation.zone == zone)
              sg_ugi_count = sg_ugi_count + 1
            end
          end

          if (params[:zone].match(/national/i))
            if (observation.diagnosis_category == 'SG_LGI')
              sg_lgi_count = sg_lgi_count + 1
            end
          else
            if (observation.diagnosis_category == 'SG_LGI' && observation.zone == zone)
              sg_lgi_count = sg_lgi_count + 1
            end
          end

          if (params[:zone].match(/national/i))
            if (observation.diagnosis_category == 'SG_GI')
              sg_gi_count = sg_gi_count + 1
            end
          else
            if (observation.diagnosis_category == 'SG_GI' && observation.zone == zone)
              sg_gi_count = sg_gi_count + 1
            end
          end

          if (params[:zone].match(/national/i))
            if (observation.diagnosis_category == 'NCD')
              ncd_count = ncd_count + 1
            end
          else
            if (observation.diagnosis_category == 'NCD' && observation.zone == zone)
              ncd_count = ncd_count + 1
            end
          end
          
          if (params[:zone].match(/national/i))
            if (observation.diagnosis_category == 'IDSR_DZ')
              idsr_count = idsr_count + 1
            end
          else
            if (observation.diagnosis_category == 'IDSR_DZ' && observation.zone == zone)
              idsr_count = idsr_count + 1
            end
          end
        end

        sg_fever_data << sg_fever_count; sg_uri_data << sg_uri_count; sg_lri_data << sg_lri_count;
        sg_ri_data << sg_ri_count; sg_ugi_data << sg_ugi_count; sg_lgi_data << sg_lgi_count;
        sg_gi_data << sg_gi_count; ncd_data << ncd_count; idsr_data << idsr_count;

      end

      hash = {
        "xaxis" => xaxis, "sg_fever_data" => sg_fever_data, "sg_uri_data" => sg_uri_data,
        "sg_lri_data" => sg_lri_data, "sg_ri_data" => sg_ri_data, "sg_ugi_data" => sg_ugi_data,
        "sg_lgi_data" => sg_lgi_data, "sg_gi_data" => sg_gi_data, "ncd_data" => ncd_data,
        "idsr_data" => idsr_data
      }

      render :text => hash.to_json and return
    end
  end

end
