

class RomanNumerals
  NUMERALS = {
    'M' => 1000,
    'D' => 500,
    'C' => 100,
    'L' => 50,
    'X' => 10,
    'V' => 5,
    'I' => 1
  }

  class << self
    def to_roman num
      return "IV" if num == 4

      res = []
      NUMERALS.map do |k, v|
        a, num = num.divmod(v)

        res << k * a
      end
      (res-['']).join
    end

    def from_roman num
      res     = []
      letters = num.scan /\w/

      letters.each_with_index do |n, i|
        n = NUMERALS[n]
        l = letters[i+1]
        t = l.nil? ? n : NUMERALS[l]
        n = -n if n < t

        res << temp = n
      end
      res.inject(:+)
    end
  end
end

print RomanNumerals.to_roman(1990)
print RomanNumerals.from_roman('MDCLXVI')

