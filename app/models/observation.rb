require 'couchrest_model'
class Observation < CouchRest::Model::Base
  property :national_id, String
  property :gender, String
  property :age, String
  property :diagnosis_short_name, String
  property :diagnosis_full_name, String
  property :facility, String
  property :obs_date, Date
  timestamps!
end
