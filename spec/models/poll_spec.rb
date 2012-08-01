require 'spec_helper'

describe Poll do

  it { should have_many(:questions)}     # uses gem 'shoulda-matchers'
  it { should respond_to(:title) }

  it "is not valid without a poll title" do
    poll = Poll.new(:title => nil)
    poll.should_not be_valid
  end

  before :each do
    @poll = Poll.create(title: "Lorem ipsum")
  end

  it "correctly saves the poll title" do
    @poll.title.should == "Lorem ipsum"
  end

  it "can access its children questions" do
    question = Question.create(:body => "This is a question?", :poll => @poll)
    @poll.questions.all.should be_an_instance_of Array
    @poll.questions.first.should == question
  end

  it "creates an admin token" do
    @poll.admin_token.should be_an_instance_of String
  end

end

