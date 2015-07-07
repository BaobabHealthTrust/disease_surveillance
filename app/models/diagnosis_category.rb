require 'couchrest_model'
class DiagnosisCategory < CouchRest::Model::Base
  property :short_name, String
  property :full_name, String
  property :category, String
  timestamps!

  design do
    view :by_short_name
    view :by_full_name
    view :by_full_name_and_category
  end
  
end
