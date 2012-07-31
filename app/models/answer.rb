class Answer < ActiveRecord::Base
  attr_accessible :body, :owner_session_id, :question_id, :response_id

  belongs_to :response
end
