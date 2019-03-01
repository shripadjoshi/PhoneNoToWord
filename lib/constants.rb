#This class is used for the returning the constants values for the converter, 
#in this cas it is returning mapping words and directory data.
class Constant
  def self.set_constants
    return [
      #number to word mappings
      {
        2 => %w(a b c),
        3 => %w(d e f),
        4 => %w(g h i),
        5 => %w(j k l),
        6 => %w(m n o),
        7 => %w(p q r s),
        8 => %w(t u v),
        9 => %w(w x y z)
      },
      #Fetch all the dictionary words
      File.readlines('dictionary.txt').map{|w| w.strip}
    ]
  end
end
