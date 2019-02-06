require "rails_helper"

RSpec.describe NewProblemCreatedMailer, type: :mailer do
  describe "new_problem" do
    let(:mail) { NewProblemCreatedMailer.new_problem }

    it "renders the headers" do
      expect(mail.subject).to eq("New problem")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
