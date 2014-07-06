class Project
  include Mongoid::Document
  field :name, type: String
  field :domain, type: String
  field :uuid, type: String
  field :status, type: String

  has_many :authorizations
  has_many :users, through: :authorizations
end
