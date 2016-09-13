# Ruby Parser Assignment

#### Step 1: Splitting code into tokens

**Function used: `Ripper.tokenize(string)`**

It simply tokenizes the given input string.

Sample output:
```
["a",
 " ",
 "=",
 " ",
 "5",
 "\n",
]
```
#### Step 2: Lexical Analysis of tokens

**Function used: `Ripper.lex(string)`**

Here, the string is split into *token type* and *tokens*. For example, `[:on_ident, "a"]` -- where `:on_ident` is the type (identifier) and `"a"` is the token.
The function also returns the *line number* and *column number*.

Sample output:
```
[[[1, 0], :on_ident, "a"],
 [[1, 1], :on_sp, " "],
 [[1, 2], :on_op, "="],
 [[1, 3], :on_sp, " "],
 [[1, 4], :on_int, "5"],
 [[1, 5], :on_nl, "\n"],...
```
#### Step 3: Creating Abstract Syntax Tree (AST):

**Function used: `Ripper.sexp(string)`**

Here, an Abstract Syntax Tree (AST) is generated using the tokens generated in previous step. It uses Ruby's grammar to do semantic analysis of the code.
The BISON parser is used for this purpose, which generates a parser code (parse.c) for parsing, using grammar of Ruby (parse.y).
The grammar of Ruby language can be found [here](https://github.com/ruby/ruby/blob/trunk/parse.y).

A tree has many nodes, each node containing tokens. A program's AST always begins with `:program` node.

Sample output:
```
[:program,
 [[:assign, [:var_field, [:@ident, "a", [1, 0]]], [:@int, "5", [1, 4]]],
  [:assign, [:var_field, [:@ident, "b", [2, 0]]], [:@int, "10", [2, 4]]],
  [:assign,
   [:var_field, [:@ident, "name", [3, 0]]],
   [:string_literal, [:string_content, [:@tstring_content, "Raj", [3, 8]]]]], ....
   ```

#### Step 4: Generating bytecode using AST

**Function used: `RubyVM::InstructionSequence.compile(file_content).to_a`**


Finally here, the bytecode is generated. The AST is converted into YARV instruction set. This instruction set is then interpreted in C code. YARV was introduced since Ruby 1.9 and has drastically increased the run-time speed of Ruby language.

Sample output:
```
["YARVInstructionSequence/SimpleDataFormat",
 2,
 3,
 1,
 {:arg_size=>0, :local_size=>5, :stack_max=>3},
 "<compiled>",
 "<compiled>",
 nil,
 1,
 :top,
 [:a, :b, :name, :result],
 {},
 [],
 [1,
  [:trace, 1],
  [:putobject, 5],
  [:setlocal_OP__WC__0, 5],
  2,
  [:trace, 1],
  [:putobject, 10],
  [:setlocal_OP__WC__0, 4],
  3,
  [:trace, 1],
  [:putstring, "Raj"],
  [:setlocal_OP__WC__0, 3],....
  ```
