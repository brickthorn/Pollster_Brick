class Response < ActiveRecord::Base
  attr_accessible :poll_id, :answers_attributes

  has_many :answers

  accepts_nested_attributes_for :answers

end
