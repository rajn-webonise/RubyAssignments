code = File.read("sample.rb")

ruby_parser =
/
    (?<class_exp>
      \n*\s*class\s+[A-Z][a-z0-9_]*\n*
      (?<func_exp> # def <spaces> function_name <endlines?>
        \n+\s*def\s+[a-z0-9_]+\n*
          (?<st_exp> #<statements, assignments and math operators>
            \n*\s*[a-z_]+\s*(=\s*[a-z0-9_]+\s*(\s*[+-\/*]\s*[a-z0-9]+\s*)*)*
          )*
        \n+\s*end
      )*
      \n+\s*end\n*
    )*
    (\g<func_exp>)* # class-less functions, attached to main
    (\g<st_exp>)*   # class-less statements, attached to main
/x

puts ruby_parser.match(code)
