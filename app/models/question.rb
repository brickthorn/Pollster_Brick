class Question < ActiveRecord::Base
  attr_accessible :answer, :body, :poll_id

  belongs_to :poll

end
