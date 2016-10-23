### ASSIGNMENT / PATTERN MATCHING

a = 1 # assignment
1 = a # match
2 = a # MatchError
[a, b, c] = [1, 2, 3] # assignment
[1, b, c] = [1, 2, 3] # assigment and match
[2, b, c] = [1, 2, 3] # MatchError

# pin operator (^) forces elixir to use existing value of variable in pattern
a = 1 # assignment
a = 2 # assignment
^a = 1 # MatchError

### IMMUTABILITY

list1 = [ 3, 2, 1 ]
list2 = [ 4 | list1 ] # list2's data includes a reference to list1, which will never change
name = "elixir"
cap_name = String.capitalize name # can't transform in place

### BUILT-IN TYPES

# atoms
atoms = [:foo, :bar?] # user-defined
atoms = :file # erlang module. wtf?

# regular expressions (equivalent)
regexps = [~r{hello}i, ~r/hello/i]

# tuples
{ status, count, action } = { :ok, 42, "next" } # assignment
{ status, file } = File.open(".irbrc") # {:ok, #PID<0.114.0>}
{ :ok, file } = File.open("notfound.txt") # MatchError

# lists
[1, 2, 3] ++ [4, 5, 6] # [1, 2, 3, 4, 5, 6]
[1, 2, 3, 4] -- [2, 4] # [1, 3]
1 in [1, 2, 3, 4] # true

# keyword lists (use for passing around options)
[name: "Jim", city: "SF"] # equivalent to [[:name, "Jim"], [:city, "SF"]]
DB.save record, name: "Jim", city: "SF" # second argument is keyword list without brackets

# maps (associative arrays)
states = %{ "CA" => "California", "WA" => "Washington" }
colors = %{ :red => 0xff0000, :green => 0x00ff00 }
colors = %{ red: 0xff0000, green: 0x00ff00 } # shortcut, only if keys are atoms
colors[:red] # 0xff0000
colors.red # 0xff0000
colors[:purple] # nil
colors.purple # KeyError

# dates and times
{:ok, d1} = Date.new(2016, 12, 25) # ok, ~D[2016-12-25]}
d2 = ~D(2016-12-25)
{:ok, t1} = Time.new(12,34,56) # {:ok, ~T[12:34:56]}
t2 = ~T[12:34:56]

# equality operators
a === b # strict equality (so 1 === 1.0 is false)
a !== b # strict inequality
a == b # value equality (so 1 == 1.0 is true)
a != b # value inequality

# boolean operators (expect true or false as first value)
a or b
a and b
not a

# relaxed boolean operators (take "truthy" arguments of any type)
a || b
a && b
!a

### REGULAR EXPRESSIONS
regex = ~r{[aeiou]}
string = "caterpillar"
Regex.run regex, string # "a"
Regex.scan regex, string # [["a"], ["e"], ["i"], ["a"]]
Regex.split regex, string # ["c", "t", "rp", "ll", "r"]
Regex.replace regex, string, "*" # "c*t*rp*ll*r"

### VARIABLE SCOPE

# "file" is scoped to the with's "do" parameter
message = with { :ok, file } = File.open("foo.txt") do
  "Opened file: #{file}"
end
IO.puts message

# use "<-" instead of "=" to not raise MatchError
with [a|_] <- [1,2,3], do: a # 1
with [a|_] <- nil, do: a # nil
with [a|_] = nil, do: a # MatchError

### ANONYMOUS FUNCTIONS

# definition and calling
sum = fn (a, b) -> a + b end #Function<12.52032458/2 in :erl_eval.expr/5>
sum.(1,2) # 3
greet = fn -> IO.puts "hello" end
greet.()

# pattern matching (with tuples)
swap = fn { a, b } -> { b, a } end
swap.( { 1, 2 } ) # { 2, 1 }

# pattern matching, multiple implementations
handle_open = fn ->
  {:ok, file} = "File contents: #{IO.read(file, :line)}"
  {_, error} = "Error: #{:file.format_error(error)}"
end
handle_open.(File.open("hello.txt")) # "File contents: Hello"
handle_open.(File.open("no_file_here.txt")) # "Error: no such file or directory"

# nested functions
greeter = fn (name) -> (fn -> "Hello #{name}" end) end
bob_greeter = greeter.("Bob")
bob_greeter.() # "Hello Bob"

# passing anonymous functions as arguments
list = [1, 2, 3]
Enum.map list, fn (val) -> val * 2 end # [2, 4, 6]

# pinned values and function parameters
greeter = fn (name, greeting) ->
  fn
    (^name) -> "#{greeting} #{name}" # use current value of "name", don't replace
    (_)     -> "I don't know you"
  end
end
mr_valim = greeter.("José", "Oi!")
IO.puts mr_valim.("José")    # => Oi! José
IO.puts mr_valim.("dave")    # => I don't know you

# shorthand for helper functions: function capture operator(&)
add_one = &(&1 + 1) # same as add_one = fn (n) -> n + 1 end
divrem = &{ div(&1, &2), rem(&1, &2) } # function that returns a tuple of quotient and remainder
divrem.(13, 5) # { 2, 3 }
Enum.map [1,2,3], &(&1 + 1) # [2,3,4]

# wrap an existing function in an anonymous function by preceding with & and ending with arity
l = &length/1 # &:erlang.length/1
l.([1,2,3,4]) # 4
l = &Enum.count/1 # Enum.count/1
l.([1,2,3,4]) # 4

### MODULES AND NAMED FUNCTIONS

# defining module functions
defmodule Times do
  def double(n) do
    n * 2
  end
  # or
  def double(n), do: n * 2
end
Times.double(2) # 4

# guard clauses
defmodule Guard do
  def what_is(x) when is_number(x) do # "is_number" is a built-in Erlang function
    IO.puts "#{x} is a number"
  end
  def what_is(x) when is_list(x) do
    IO.puts "#{inspect(x)} is a list"
  end
end
Clauses.what_is([1,2])

# parameter defaults
defmodule Defaults do
  def func(p1, p2 \\ 2, p3 \\ 3, p4) do
    IO.inspect [p1, p2, p3, p4]
  end
end
Defaults.func("a", "b") # ["a", 2, 3, "b"]
Defaults.func("a", "b", "c") # ["a", "b", 3, "c"]
Defaults.func("a", "b", "c", "d") # ["a", "b", 3, "c"]

# parameter defaults with guard clauses
defmodule DefaultsWithGuard do
  def func(p1, p2 \\ 123)
  def func(p1, p2) when is_list(p1) do
    "You said #{p2} with a list"
  end
  def func(p1, p2) do
    "You passed in #{p1} and #{p2}"
  end
end
DefaultsWithGuard.func(99) # You passed in 99 and 123
DefaultsWithGuard.func(99, "cat") # You passed in 99 and "cat"
DefaultsWithGuard.func([99]) # You said 123 with a list

# nested modules
defmodule Outer.Inner do
  def run do
  end
end
Outer.Inner.run()

# import
defmodule UseImport do
  def func do
    import List, only: [flatten: 1]
    flatten [5, [6, 7], 8] # instead of List.flatten
  end
end
UseImport.func() # [5,6,7,8]

### PIPE OPERATOR

DB.find_customers
  |> Orders.for_customer # first argument is result of DB.find_customers
  |> sales_tax(2016) # first argument is result of Orders.for_customer
  |> prepare_filing # first argument is result of sales_tax

### LISTS

# every list is either empty, or has a head (single element) and a tail (another list)
list = [] # empty list
list = [ 1 | [] ] # [1], where head is 1 and tail is empty list
list = [ 1 | [ 2 | [] ] ] # [1, 2]
list = [ 1 | [ 2 | [ 3 | [] ] ] ] # [1, 2, 3]
[head | tail] = [1, 2, 3] # head == 1, tail == [2, 3]

# recursively calculate squares of a list by squaring the head of the list, then the tail
defmodule MyList do
  def square([]), do: [] # empty list
  def square([head | tail]), do: [head * head | square(tail)]
end
MyList.square([1,2,3]) # [ 1, 4, 9 ]

# generalize the recursive call above into a new map function
defmodule MyList do
  def map([], _func), do: []
  def map([head | tail], func), do: [func.(head) | map(tail, func)]
end
MyList.map([1,2,3], &(&1 * &1)) # [ 1, 4, 9 ]
