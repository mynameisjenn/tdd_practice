require "rspec/autorun"

# calc = Calculator.new
# calc.add(5, 10) return 15

class Calculator
	def add(a, b)
		a + b 
	end

	def factorial(n)
		if n == 0 
			1
		else
			(1..n).reduce(:*)
		end
	end
end

describe Calculator do
		describe "#add" do
			it "returns the sum of two arguments" do
				calc = Calculator.new

				expect(calc.add(5, 10)).to eq(15)
			end

			it "returns the sum of two different arguments" do
				calc = Calculator.new

				expect(calc.add(4, 7)).to eq(11)
			end
		end	

		describe "#factorial" do
			it "returns 1 when given 0" do
				calc = Calculator.new

				expect(calc.factorial(0)).to eq(1)
		end

			it "returns 120 when given 5" do
				calc = Calculator.new

				expect(calc.factorial(5)).to eq(120)
		end

			it "returns 362,880 when given 9" do
				calc = Calculator.new

				expect(calc.factorial(9)).to eq(362880)
		end
	end
end
