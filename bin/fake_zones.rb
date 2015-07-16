def fake_zones
  puts "****************************FAKING ZONES********************************"
  puts "NOT TO BE USED IN LIVE SYSTEMS. For development purposes only"
  zones = ['zone_northern', 'zone_c_east', 'zone_c_west', 'zone_s_east', 'zone_s_west']
  puts "Fake in progress.................."
  Observation.all.each do |obs|
      next unless obs.zone.blank?
      random_number = rand(zones.length)
      random_zone = zones.shuffle[random_number]#Just random
      puts "Randomly selected #{random_zone}"
      obs.zone = random_zone 
      obs.save
  end
  puts "Faking Done. Ready to use the app"
end
fake_zones