require './lib/more_methods'

RSpec.describe MoreMethods do
  let(:more_methods) { MoreMethods.new }

  it 'exists' do
    expect(more_methods).to be_a(MoreMethods)
  end

  it '#character_house(first_name, house_name)' do
    expect(more_methods.character_house("Tyrion", "Lannister")).to eq("Tyrion, house of Lannister.")
  end

  it '#triangle_checker(angle_1, angle_2, angle_3)' do
    expect(more_methods.triangle_checker(30, 60, 90)).to eq(true)
    expect(more_methods.triangle_checker(30, 30, 90)).to eq(false)
  end

  it '#fizz_buzz(max_number)' do
    expect(more_methods.fizz_buzz(10)).to eq([1, 2, "Fizz", 4, "Buzz", "Fizz", 7, 8, "Fizz", "Buzz"])
  end

  it '#big_backwards(string)' do
    expect(more_methods.big_backwards("hello there")).to eq("EREHT OLLEH")
  end

  it '#informed_counter(string)' do
    expect(more_methods.informed_counter("hello there")).to eq("There are 11 characters in the string 'hello there'.")
  end

  it '#big_ordered_array(array)' do
    test_array = ['i', 'love', 'making', 'arrays', 'full', 'of', 'strings']

    expect(more_methods.big_ordered_array(test_array)).to eq(['I', 'OF', 'FULL', 'LOVE', 'ARRAYS', 'MAKING', 'STRINGS'])
  end

  it '#lucky_number(num_1, num_2)' do
    expect(more_methods.lucky_number(7, 7)).to eq("Lucky!")
    expect(more_methods.lucky_number(7, 6)).to eq("Unlucky!")
    expect(more_methods.lucky_number(13, 7)).to eq("Lucky!")
    expect(more_methods.lucky_number(13, 13)).to eq("Unlucky!")
  end
end