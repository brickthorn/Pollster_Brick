class Question < ActiveRecord::Base
  attr_accessible :answer, :body, :poll

  belongs_to :poll

end
