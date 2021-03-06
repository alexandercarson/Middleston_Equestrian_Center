require "rails_helper"

RSpec.describe UpdateHorseMailer, type: :mailer do
  describe "update_user" do
    let(:mail) { UpdateHorseMailer.update_user }

    it "renders the headers" do
      expect(mail.subject).to eq("Update user")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
