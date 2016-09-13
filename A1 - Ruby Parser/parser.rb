require 'ripper'
require 'pp'

file_content = File.read("./code.rb")

puts "\nFirst Step: Tokenize the program!"
pp Ripper.tokenize(file_content)

puts "\nNext Step: Do lexical analysis on the tokens!"
pp Ripper.lex(file_content)

puts "\nNext Step: Parse to generate AST! (Symbolic Expression Tree)"
pp Ripper.sexp(file_content)

puts "\nNext Step: Compile the AST into bytecode"
pp (RubyVM::InstructionSequence.compile(file_content).to_a)
