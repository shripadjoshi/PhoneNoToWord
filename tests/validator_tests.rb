require_relative '../lib/validator'
require 'rspec'

RSpec.describe ValidateNumber do

  it 'validate number successfully' do
    expect(ValidateNumber.validate('2282668687')).eql?('Validated')
  end

  it 'get error message if the phone number contains 0' do
    expect(ValidateNumber.validate('6686780825')).eql?('Please enter the number in proper format without special characters, 0 or 1.')
  end

  it 'get error message if the phone number contains 1' do
    expect(ValidateNumber.validate('6686781825')).eql?('Please enter the number in proper format without special characters, 0 or 1.')
  end

  it 'get error message if no phone number is entered' do
    expect(ValidateNumber.validate('')).eql?('Please enter the phone number.')
  end

  it 'get error message if phone number is more then 10 digits' do
    expect(ValidateNumber.validate('66867878251')).eql?('Please enter the exact 10 digit phone number.')
  end

  it 'get error message if phone number is less then 10 digits' do
    expect(ValidateNumber.validate('668678782')).eql?('Please enter the exact 10 digit phone number.')
  end

  it 'get error message if phone number contains special characters' do
    expect(ValidateNumber.validate('668678782%')).eql?('Please enter the number in proper format without special characters, 0 or 1.')
  end

end