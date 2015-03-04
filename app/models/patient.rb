require 'couchrest_model'
class Patient < CouchRest::Model::Base
  def national_id
    self['_id']
  end

  def national_id=(value)
    self['_id'] = value
  end

  property :given_name, String
  property :middle_name, String
  property :family_name, String
  property :phone_numbers, [String]
  property :address1, String
  property :address2, String
  property :city_village, String
  property :county_district, String
  timestamps!
end
