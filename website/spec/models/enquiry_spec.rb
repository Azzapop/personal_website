require 'rails_helper'

RSpec.describe Enquiry, type: :model do
  it 'should have a valid factory' do
    e = FactoryGirl.build(:enquiry)
    expect(e).to be_valid
  end
  it 'should be valid with an email and message' do
    e = Enquiry.create(
      FactoryGirl.attributes_for(:enquiry)
    )
    expect(e).to be_valid
  end
  it 'should be invalid without an email' do
    e = Enquiry.create(email: nil)
    expect(e).to have(1).errors_on(:email)
  end
  it 'should be invalid without a correctly formatted email' do
    e = Enquiry.create(email: 'invalid')
    expect(e).to have(1).errors_on(:email)
  end
  it 'should be invalid without a message' do
    e = Enquiry.create(message: nil)
    expect(e).to have(1).errors_on(:message)
  end
end