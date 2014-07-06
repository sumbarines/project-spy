class Project
  include Mongoid::Document
  field :name, type: String
  field :domain, type: String
  field :uuid, type: String
  field :verfied, type: Boolean, default: false

  has_many :authorizations
  belongs_to :user

  before_create :set_uuid

  protected

  def set_uuid
    self.uuid = SecureRandom.hex(30)
  end

end
