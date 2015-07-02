require 'nokogiri'
class AdminController < ApplicationController
  def home
    
  end

  def index

  end

  def national_dashboard
    
  end

  def regional_dashboard

  end

  def district_dashboard

  end

  def northern_zone

  end

  def central_zone

  end

  def southern_zone

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
          date_params =  {
            "start_date" => start_date,
            "end_date" => end_date
            }

          diagnoses = RestClient.post(uri, date_params) rescue []
          remote_result = JSON.parse(diagnoses) rescue []
  end

  def concept_groups
    
  end
end
