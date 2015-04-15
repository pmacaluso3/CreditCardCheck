# U2.W5: Class Warfare, Validate a Credit Card Number


# I worked on this challenge [with: Emmanuel Obi].
# I spent [1] hours on this challenge.

# 2. Pseudocode

# Input: a 16 digit integer
# Output: either true or false
# Steps:
# 0) Check to see if the input has 16 digits
# 1) Turn the input into a string and use #split to turn it into an array
# 2) Assign the array we get to a new variable 
# 3) Use #map! (with #.to_i) to convert the array of strings into an array of integers
# 4) Use #map! {|num| num * 2 if num.index % 2 == 0} to double every other number
# 5) Use an if conditional to either: add the digit together, or break it apart and then add its digits together (using %)
# 6) Check this total % 10 == 0


# 3. Initial Solution

# Don't forget to check on initialization for a card length
# of exactly 16 digits

# class CreditCard
# 	def initialize(number)
# 		@number = number
# 		if !validity_check(number)
# 			raise ArgumentError.new("Only 16-digit numbers are considered valid.")
# 		end
# 	end

# 	def validity_check(number)
# 		number.to_s.length == 16
# 	end

# 	def check_card
# 		@number = @number.to_s.split("")
# 		@number.map! {|num| num.to_i}
# 		p @number
# 		luhn_doubled = []
# 		@number.each_with_index {|num, i| 
# 			if i.even?
# 				luhn_doubled << num * 2
# 			else
# 				luhn_doubled << num
# 			end
# 		}
# 		p luhn_doubled
# 		luhn_sum = luhn_doubled.inject(0) {|acc, n|
# 			if n >= 10
# 				acc += (1 + n%10)
# 			else
# 				acc += n
# 			end
# 			#puts luhn_sum
# 		}
# 		puts luhn_sum
# 		return luhn_sum%10 == 0
# 	end
# end




# 4. Refactored Solution

class CreditCard
	def initialize(number)
		@number = number
		if !validity_check(number)
			raise ArgumentError.new("Only 16-digit numbers are considered valid.")
		end
	end

	def validity_check(number)
		number.to_s.length == 16
	end

	def check_card
		@number = @number.to_s.split("")
		@number.map! {|num| num.to_i}
		p @number
		luhn_doubled = []
		@number.each_with_index {|num, i| i.even? ? luhn_doubled << num*2 : luhn_doubled << num}
		p luhn_doubled
		luhn_sum = luhn_doubled.inject(0) {|acc, n|
			if n >= 10
				acc += (1 + n%10)
			else
				acc += n
			end
			#puts luhn_sum
		}
		puts luhn_sum
		return luhn_sum%10 == 0
	end
end




# 1. DRIVER TESTS GO BELOW THIS LINE






# 5. Reflection
