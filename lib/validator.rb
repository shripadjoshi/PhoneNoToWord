#This is a validator class for the phone number
class ValidateNumber
  
  #Class method to validate the phone number
  def self.validate(number)
    phone_no = number.to_s.strip
    if (phone_no.nil? || phone_no.empty?)
      return "Please enter the phone number."
    elsif(phone_no.length != 10)
      return "Please enter the exact 10 digit phone number."
    elsif(!phone_no.match?(/^[2-9]*$/))
      return "Please enter the number in proper format without special characters, 0 or 1."
    end
    return "Validated"
  end
end