require_relative 'constants'
require 'byebug'

module Roman

  def self.hi
    "HI"
  end

  def self.parse(roman)
    token = roman.upcase.split(" ").map(&:to_sym)

    number = 0
    index = 0
    previous = {}
    while index < token.size

      if(previous[:number] && $VALUE[token[index]] > previous[:number])
        return "Current numeral '#{token[index]}' can't be greater than the previous one"
      end

      if index<token.size-1 && $VALUE[token[index]] < $VALUE[token[index+1]]
          if !decimal($VALUE[token[index]])
            return "Can't subtract non-decimal numeral '#{token[index]}'"
          end
          previous[:number] = $VALUE[token[index]]
          previous[:count] = 1
          number += $VALUE[token[index+1]] - $VALUE[token[index]]
          index+=2
      else
        if(previous[:number] == $VALUE[token[index]] && previous[:count] == 3)
          return "Numeral '#{token[index]}' has repeated more than thrice!"
        elsif (!decimal($VALUE[token[index]]) && previous[:number] == $VALUE[token[index]])
          return "Non-decimal numeral '#{token[index]}', not allowed to be repeated!"
        elsif previous[:number] == $VALUE[token[index]]
          previous[:count] += 1
        else
          previous[:number] = $VALUE[token[index]]
          previous[:count] = 1
        end

        number += $VALUE[token[index]]
        index += 1
      end

    end # while end
    number
  end # function end

  private
    def self.decimal(number)
      !!(number == 1 || number == 10 || number == 100 || number == 1000)
    end

end
