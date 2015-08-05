require 'open-uri'
module ApplicationHelper
  def feeds
    pull_date = Date.today
    feeds = Feed.by_pull_date.key(pull_date.to_s).all
    headlines = []
    #uri = "http://www.who.int/feeds/entity/csr/don/en/rss.xml"
    urls = [
      "http://www.who.int/feeds/entity/csr/don/en/rss.xml",
      "http://www.who.int/feeds/entity/csr/disease/avian_influenza/en/rss.xml",
      "http://www.who.int/feeds/entity/mediacentre/news/en/rss.xml"
    ]

    if feeds.blank?
      urls.each do |uri|
        output = RestClient.get(uri)
        doc = Nokogiri::XML(output)
        xml = doc.xpath("//channel/item").map do |i|
          {
            'title' => i.xpath('title').text,
            'description' => i.xpath('description').text,
            'published_date' => i.xpath('pubDate').text,
            'link' => i.xpath('link').text
          }
        end
        xml.each do |x|
          Feed.create({
              :title => x["title"],
              :description => x["description"],
              :published_date => x["published_date"],
              :link => x["link"],
              :pull_date => pull_date.to_s
            })
        end
      end
    end
    
    xml = Feed.by_pull_date.key(pull_date.to_s).all

    headlines = xml.map{|x|"<a href='#{x['link']}' target='_blank' class='feeds'>" .to_s + x["title"].to_s + "</a>"}.join("<span class='separator'>|</span>")
    return headlines
  end

  def internet_connection?
    begin
      true if open("http://www.google.com", :read_timeout => 5 )
    rescue
      false
    end
  end
  
end
