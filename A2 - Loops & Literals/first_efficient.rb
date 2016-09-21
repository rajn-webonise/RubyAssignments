# Returns sum of values in list
def sum(list)
  list.reduce(&:+).to_i
end

def valid?(list)
  right_sum = sum(list) - list[0]
  left_sum = 0
  (list.length).times do |index|
    return true if left_sum==right_sum
    left_sum += list[index]
    right_sum -= list[index+1] || 0
  end
  return false
end

# START OF PROGRAM
puts "Enter number of test cases:"
test_cases = gets.chomp.to_i

test_cases.times do |test_case|
  puts "Test case ##{test_case+1}", "Enter a list of numbers: "
  list = gets.chomp.split(' ').map(&:to_i)

  if valid?(list)
    puts "YES"
  else
    puts "NO"
  end
end
