require 'ripper'
require 'pp'

file_content = File.read("./code.rb")

puts "First Step: Tokenize!"
pp Ripper.tokenize(file_content)

puts "Next Step: Parse the tokens!"
pp Ripper.lex(file_content)

puts "Next Step: Generate AST! (Symbolic Expression Tree)"
pp Ripper.sexp(file_content)
