module ApplicationHelper
  def feeds
    pull_date = Date.today
    feeds = Feed.by_pull_date.key(pull_date.to_s).all
    headlines = []
    uri = "http://www.who.int/feeds/entity/csr/don/en/rss.xml"
    if feeds.blank?
      output = RestClient.get(uri)
      doc = Nokogiri::XML(output)
      xml = doc.xpath("//channel/item").map do |i|
        {
          'title' => i.xpath('title').text,
          'description' => i.xpath('description').text,
          'published_date' => i.xpath('pubDate').text
        }
      end
      xml.each do |x|
        Feed.create({
            :title => x["title"],
            :description => x["description"],
            :published_date => x["published_date"],
            :pull_date => pull_date.to_s
          })
      end
    else
      xml = Feed.by_pull_date.key(pull_date.to_s).all
    end

    headlines = xml.map{|x|x["title"]}.join("<span class='separator'>|</span>")
    return headlines
  end
end
