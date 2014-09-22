require 'rails_helper'

describe Message, :vcr => true do

  it { should validate_presence_of :to }
  it { should validate_presence_of :from }
  it { should validate_presence_of :body }



  it "doesn't save the message if twilio gives an error"do
      message = Message.new(:body => 'hi', :to => '111111', :from => '13204002007')
      expect(message.save).to eq false
    end

  it 'adds and error is the number is invalid' do
    message = Message.new(:body => 'hi', :to => '111111', :from => '13204002007')
    message.save
    expect(message.errors[:base]).to eq ["The 'To' number 111111 is not a valid phone number."]
  end
end
