xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Disease Surveillance Dashboard"
    xml.description "Updating you with outbreaks as they happen"
    xml.link "http://test.com"

    5.times do |i|
      xml.item do
        xml.title "Disease #{i}"
        xml.description "Your data for Disease #{i} goes here.... "
        xml.pubDate "#{Date.today}"
        xml.link "http:disease_#{i}.com"
        xml.guid "Your data here"
      end
    end
  end
end