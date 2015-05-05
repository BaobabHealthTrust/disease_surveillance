require 'nokogiri'
class AdminController < ApplicationController
  def home
  end

  def index
  end

  def national_dashboard
    uri = "http://www.who.int/feeds/entity/csr/don/en/rss.xml"
    output = RestClient.get(uri)
    doc = Nokogiri::XML(output)
=begin
    @xml = doc.xpath("//channel/item").map do |i|
      {
        'title' => i.xpath('title').text, 'description' => i.xpath('description').text
      }
    end
    #raise @xml.inspect
=end
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
end
