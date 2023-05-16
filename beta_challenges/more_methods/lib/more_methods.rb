class MoreMethods

  def character_house(first_name, house_name)
    "#{first_name}, house of #{house_name}."
  end

  def triangle_checker(angle_1, angle_2, angle_3)
    angle_1 + angle_2 + angle_3 == 180
  end

  def fizz_buzz(max_number)
    (1..max_number).map do |number|
      if (number % 3).zero? && (number % 5).zero?
        'FizzBuzz'
      elsif (number % 3).zero?
        'Fizz'
      elsif (number % 5).zero?
        'Buzz'
      else
        number
      end
    end
  end

  def big_backwards(string)
    string.reverse.upcase
  end

  def informed_counter(string)
    total = string.length
    "There are #{total} characters in the string '#{string}'."
  end

  def big_ordered_array(array)
    result = array.map(&:upcase).sort
    result.sort_by(&:length)
  end

  def lucky_number(num_1, num_2)
    if ((num_1 + num_2) % 13).zero?
      'Unlucky!'
    else
      'Lucky!'
    end
  end
end