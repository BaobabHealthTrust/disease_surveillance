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
    @xml = doc.xpath("//channel/item").map do |i|
      {
        'title' => i.xpath('title').text, 'description' => i.xpath('description').text
      }
    end
    @headlines = @xml.map{|x|x["title"]}.join("<span class='separator'>|</span>")
  end

  def regional_dashboard
    uri = "http://www.who.int/feeds/entity/csr/don/en/rss.xml"
    output = RestClient.get(uri)
    doc = Nokogiri::XML(output)
    @xml = doc.xpath("//channel/item").map do |i|
      {
        'title' => i.xpath('title').text, 'description' => i.xpath('description').text
      }
    end
    @headlines = @xml.map{|x|x["title"]}.join("<span class='separator'>|</span>")
  end

  def district_dashboard
    uri = "http://www.who.int/feeds/entity/csr/don/en/rss.xml"
    output = RestClient.get(uri)
    doc = Nokogiri::XML(output)
    @xml = doc.xpath("//channel/item").map do |i|
      {
        'title' => i.xpath('title').text, 'description' => i.xpath('description').text
      }
    end
    @headlines = @xml.map{|x|x["title"]}.join("<span class='separator'>|</span>")
  end

  def northern_zone
    uri = "http://www.who.int/feeds/entity/csr/don/en/rss.xml"
    output = RestClient.get(uri)
    doc = Nokogiri::XML(output)
    @xml = doc.xpath("//channel/item").map do |i|
      {
        'title' => i.xpath('title').text, 'description' => i.xpath('description').text
      }
    end
    @headlines = @xml.map{|x|x["title"]}.join("<span class='separator'>|</span>")
  end

  def central_zone
    uri = "http://www.who.int/feeds/entity/csr/don/en/rss.xml"
    output = RestClient.get(uri)
    doc = Nokogiri::XML(output)
    @xml = doc.xpath("//channel/item").map do |i|
      {
        'title' => i.xpath('title').text, 'description' => i.xpath('description').text
      }
    end
    @headlines = @xml.map{|x|x["title"]}.join("<span class='separator'>|</span>")
  end

  def southern_zone
    uri = "http://www.who.int/feeds/entity/csr/don/en/rss.xml"
    output = RestClient.get(uri)
    doc = Nokogiri::XML(output)
    @xml = doc.xpath("//channel/item").map do |i|
      {
        'title' => i.xpath('title').text, 'description' => i.xpath('description').text
      }
    end
    @headlines = @xml.map{|x|x["title"]}.join("<span class='separator'>|</span>")
  end

  def diagnosis_settings_menu
    uri = "http://www.who.int/feeds/entity/csr/don/en/rss.xml"
    output = RestClient.get(uri)
    doc = Nokogiri::XML(output)
    @xml = doc.xpath("//channel/item").map do |i|
      {
        'title' => i.xpath('title').text, 'description' => i.xpath('description').text
      }
    end
    @headlines = @xml.map{|x|x["title"]}.join("<span class='separator'>|</span>")
  end

  def add_diagnosis
    uri = "http://www.who.int/feeds/entity/csr/don/en/rss.xml"
    output = RestClient.get(uri)
    doc = Nokogiri::XML(output)
    @xml = doc.xpath("//channel/item").map do |i|
      {
        'title' => i.xpath('title').text, 'description' => i.xpath('description').text
      }
    end
    @headlines = @xml.map{|x|x["title"]}.join("<span class='separator'>|</span>")
  end

  def remove_diagnosis
    uri = "http://www.who.int/feeds/entity/csr/don/en/rss.xml"
    output = RestClient.get(uri)
    doc = Nokogiri::XML(output)
    @xml = doc.xpath("//channel/item").map do |i|
      {
        'title' => i.xpath('title').text, 'description' => i.xpath('description').text
      }
    end
    @headlines = @xml.map{|x|x["title"]}.join("<span class='separator'>|</span>")
  end

  def view_diagnoses
    uri = "http://www.who.int/feeds/entity/csr/don/en/rss.xml"
    output = RestClient.get(uri)
    doc = Nokogiri::XML(output)
    @xml = doc.xpath("//channel/item").map do |i|
      {
        'title' => i.xpath('title').text, 'description' => i.xpath('description').text
      }
    end
    @headlines = @xml.map{|x|x["title"]}.join("<span class='separator'>|</span>")
  end

  def feed
    render :template => '/admin/feed.rss.builder', :layout => false
  end
  
end
