require 'spec_helper'

describe SmsController do

  describe "POST index" do
    it "creates a new message" do
      Guildy.create(:number => "2562256830", :name => "Joshua Coffee")
      Event.skip_callback(:create, :after, :send_sms)
      Event.create(:name => "Testing Event", :guildy_ids => [Guildy.last.id])
      text = {"AccountSid"=>"AC655e0d8dcf0d6079a897fb9c2dc0be44", "Body"=>"No", "ToZip"=>"36203", "FromState"=>"AL", "ToCity"=>"ANNISTON", "SmsSid"=>"SMd7041c6d90f8d6acdbd55305c3f0b754", "ToState"=>"AL", "To"=>"+12564035101", "ToCountry"=>"US", "FromCountry"=>"US", "SmsMessageSid"=>"SMd7041c6d90f8d6acdbd55305c3f0b754", "ApiVersion"=>"2010-04-01", "FromCity"=>"ANNISTON", "SmsStatus"=>"received", "From"=>"+12562256830", "FromZip"=>"36207"}

      expect{
        post :index,  text 
      }.to change(Message,:count).by(1)
      
    end
  end

end
