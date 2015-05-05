require 'couchrest_model'
class Observation < CouchRest::Model::Base
  property :national_id, String
  property :diagnosis, String
  property :obs_date, Date
  timestamps!
end
