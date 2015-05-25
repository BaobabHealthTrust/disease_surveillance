require 'couchrest_model'

class Feed < CouchRest::Model::Base
  use_database "feed"
=begin
  def pull_date
    self['_id']
  end

  def pull_date=(value)
    self['_id'] = value
  end
=end
  property :title, String
  property :description, String
  property :published_date, Date
  property :pull_date, Date
  timestamps!

  design do
    view :by_published_date
    view :by_pull_date
  end
end
