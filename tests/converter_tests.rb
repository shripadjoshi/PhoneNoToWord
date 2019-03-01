require_relative '../converter'
require 'rspec'

RSpec.describe ConvertNumberToWord do

  it 'converts 2282668687 phone number to words' do
    expect(ConvertNumberToWord.new().convertToWords('2282668687')).to match_array( ["catamounts", ["act", "amounts"], ["act", "contour"], ["bat", "amounts"], ["bat", "contour"], ["cat", "contour"], ["acta", "mounts"], ["act", "boo", "tots"], ["act", "boo", "tour"], ["act", "con", "tots"], ["act", "con", "tour"], ["act", "coo", "tots"], ["act", "coo", "tour"], ["bat", "boo", "tots"], ["bat", "boo", "tour"], ["bat", "con", "tots"], ["bat", "con", "tour"], ["bat", "coo", "tots"], ["bat", "coo", "tour"], ["cat", "boo", "tots"], ["cat", "boo", "tour"], ["cat", "con", "tots"], ["cat", "con", "tour"], ["cat", "coo", "tots"], ["cat", "coo", "tour"], ["act", "boot", "mus"], ["act", "boot", "nus"], ["act", "boot", "our"], ["act", "coot", "mus"], ["act", "coot", "nus"], ["act", "coot", "our"], ["bat", "boot", "mus"], ["bat", "boot", "nus"], ["bat", "boot", "our"], ["bat", "coot", "mus"], ["bat", "coot", "nus"], ["bat", "coot", "our"], ["cat", "boot", "mus"], ["cat", "boot", "nus"], ["cat", "boot", "our"], ["cat", "coot", "mus"], ["cat", "coot", "nus"], ["cat", "coot", "our"], ["acta", "mot", "mus"], ["acta", "mot", "nus"], ["acta", "mot", "our"], ["acta", "not", "mus"], ["acta", "not", "nus"], ["acta", "not", "our"], ["acta", "oot", "mus"], ["acta", "oot", "nus"], ["acta", "oot", "our"]] )
  end

  it 'converts 6686787825 phone number to words' do
    expect(ConvertNumberToWord.new().convertToWords('6686787825')).to match_array( ["motortruck", ["noun", "struck"], ["onto", "struck"], ["motor", "usual"], ["nouns", "truck"], ["nouns", "usual"], ["mot", "opt", "puck"], ["mot", "opt", "ruck"], ["mot", "opt", "suck"], ["mot", "ort", "puck"], ["mot", "ort", "ruck"], ["mot", "ort", "suck"], ["not", "opt", "puck"], ["not", "opt", "ruck"], ["not", "opt", "suck"], ["not", "ort", "puck"], ["not", "ort", "ruck"], ["not", "ort", "suck"], ["oot", "opt", "puck"], ["oot", "opt", "ruck"], ["oot", "opt", "suck"], ["oot", "ort", "puck"], ["oot", "ort", "ruck"], ["oot", "ort", "suck"], ["mot", "opts", "taj"], ["mot", "opus", "taj"], ["mot", "orts", "taj"], ["not", "opts", "taj"], ["not", "opus", "taj"], ["not", "orts", "taj"], ["oot", "opts", "taj"], ["oot", "opus", "taj"], ["oot", "orts", "taj"], ["noun", "pup", "taj"], ["noun", "pur", "taj"], ["noun", "pus", "taj"], ["noun", "sup", "taj"], ["noun", "suq", "taj"], ["onto", "pup", "taj"], ["onto", "pur", "taj"], ["onto", "pus", "taj"], ["onto", "sup", "taj"], ["onto", "suq", "taj"]] )
  end

  it 'get error message if the phone number contains 0' do
    expect(ConvertNumberToWord.new().convertToWords('6686780825')).eql?('Please enter the number in proper format without special characters, 0 or 1.')
  end

  it 'get error message if the phone number contains 1' do
    expect(ConvertNumberToWord.new().convertToWords('6686781825')).eql?('Please enter the number in proper format without special characters, 0 or 1.')
  end

  it 'get error message if no phone number is entered' do
    expect(ConvertNumberToWord.new().convertToWords('')).eql?('Please enter the phone number.')
  end

  it 'get error message if phone number is more then 10 digits' do
    expect(ConvertNumberToWord.new().convertToWords('66867878251')).eql?('Please enter the exact 10 digit phone number.')
  end

  it 'get error message if phone number is less then 10 digits' do
    expect(ConvertNumberToWord.new().convertToWords('668678782')).eql?('Please enter the exact 10 digit phone number.')
  end

  it 'get error message if phone number contains special characters' do
    expect(ConvertNumberToWord.new().convertToWords('668678782%')).eql?('Please enter the number in proper format without special characters, 0 or 1.')
  end

end