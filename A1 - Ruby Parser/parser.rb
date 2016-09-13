require 'ripper'
require 'awesome_print' # External gem

file_content = File.read("./code.rb")

puts "First Step: Tokenize!"
ap Ripper.tokenize(file_content)

puts "Next Step: Parse the tokens!"
ap Ripper.lex(file_content)

puts "Next Step: Generate AST! (Symbolic Expression Tree)"
ap Ripper.sexp(file_content)
