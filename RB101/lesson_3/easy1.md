* Question 1
  * I would expect it to print
          1
          2
          2
          3
    because doing numbers.uniq does not mutate the caller, it only returns a new array. When using puts to print the original array, it's unchanged.
* Question 2
  * ! is used in Ruby normal as a character to reverse values (e.g. !true -> false) and also to indicate a method mutates the caller (e.g. if we had used numbers.uniq! above, it would show that it mutates the caller.)
  * ? is used to indicate that a method will likely query the object, and return a boolean value (e.g. numbers.include?("2) -> true)
* Question 3
* Question 4
* Question 5
* Question 6
* Question 7
