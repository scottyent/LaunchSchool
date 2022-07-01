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
  1. what is != and where should you use it?
    * this is equivalent to "not equal" so when you want to check that something isn't equal to a particular value, you would use this for comparison
  2. put ! before something, like !user_name
    * I believe it would reverse it's truthiness value. If it would have evaluated to true, it will now be false and vice versa
  3. put ! after something, like words.uniq!
    * This is normally the indicator that the method will mutate the caller
  4. put ? before something
    * Ternary operator
  5. put ? after something
    * After a method, it implies it will return a boolean (like in .include?) (though you don't know fo sure, look at the docs)
  6. put !! before something, like !!user_name
    * Converts truthiness values into a boolean value. So for example, 5 is an integer and is truthy, but !!5 will literally return the boolean value true

* Question 3
    advice = "Few things in life are as important as house training your pet dinosaur."
    advice.sub!("important", "urgent")
    puts advice
    "Few things in life are as urgent as house training your pet dinosaur."
* Question 4
  * delete_at deletes by index
  * delete deletes I believe all matches of that element
  So in the instance of numbers = [1, 2, 3, 4, 5], delete_at(1) would delete the number 2, and delete(1) removes the number 1
* Question 5
  * (10...100).include?(42) -> (10..100).cover?(42) was preferred answer
* Question 6
  * Show 2 different ways to concatenate the string: famous_words = "seven years ago..."
  * famous_words = "Four score and " + famous_words
  * famous_words.insert(0, "Four score and ")
  * Other examples given as the official answers:
    * famous_words.prepend("Four score and ")
    * "Four score and " << famous_words
* Question 7
  * flintstones.flatten!
* Question 8
  * flintstones.select! { |key, value| key == "Barney" }
  * Official answer: flintstones.assoc("Barney") -> which returns a new array specifically with that key value pair