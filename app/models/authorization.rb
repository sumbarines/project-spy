class Authorization
  include Mongoid::Document
  field :role, type: String

  belongs_to :project
  belongs_to :user
end
