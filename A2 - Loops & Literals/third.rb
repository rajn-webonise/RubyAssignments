# START OF PROGRAM
print "Please enter a line> "
# Splits string into character array.
line_char_array = gets.chomp.split(//)
# Prints original string
puts line_char_array.join()

# Keeps rejecting indexes with odd values at every iteration.
while line_char_array.length>1 do
  line_char_array = line_char_array.reject.with_index{|val,index| index%2==1 }
  puts line_char_array.join()
end
