class Poll < ActiveRecord::Base
  attr_accessible :admin_token, :public_url, :title

  has_many :questions

  validates_uniqueness_of :admin_token

  before_validation :generate_admin_token

  private
    def generate_admin_token
      self.admin_token = rand(36**8).to_s(36) if self.new_record? and self.admin_token.nil?
    end

end
