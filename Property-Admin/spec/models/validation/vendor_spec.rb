require 'rails_helper'


RSpec.describe Vendor, :type => :model do
  subject {
    described_class.new(refno: "111" , name: "vendor",
    person: "me" , category: "other", phone: "09876543211")
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a refno" do
    subject.refno = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a name" do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a person" do
    subject.person = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a categoy" do
    subject.category = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a phone with minimum 7 character" do
    subject.phone = "09923"
    expect(subject).to_not be_valid
  end

end

