require 'couchrest_model'
class Observation < CouchRest::Model::Base
  property :national_id, String
  property :diagnosis, String
  timestamps!
end
