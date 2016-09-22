def palindrome(a)
  puts "#{a}\t #{!!(a =~ /\A(?<palindrome>| \w | (?: (?<l>\w) \g<palindrome> \k<l+0> ))\z/x )}"
end

palindrome("raj")

palindrome("rajar")

palindrome("rajjar")

palindrome("ra2j")
