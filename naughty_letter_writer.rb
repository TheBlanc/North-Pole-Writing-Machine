require 'erb'

kids_data   = File.read('data/kids-data.txt')
naughty_letter = File.read('templates/naughty_letter_template.txt.erb')

kids_data.each_line do |kid|

  kid_data_array = kid.split

  name     = kid_data_array[0]
  behavior = kid_data_array[1]

  all_toys = kid_data_array[2..7]
  random_toy = all_toys.sample
  # loop that wont let random_toy be the 'Kaleidoscope'
    while random_toy == 'Kaleidoscope'
      random_toy = all_toys.sample
    end
  all_toys.delete(random_toy)
  toy_list = all_toys[0..-2]
  last_toy = all_toys[-1]

  infraction = kid_data_array[14..-1]


  next unless behavior == 'naughty'

  filename    = 'letters/naughty/' + name + '.txt'
  letter_text = ERB.new(naughty_letter, nil, '-').result(binding)

  puts "Writing #{filename}."
  File.write(filename, letter_text)

end

puts 'Done!'
