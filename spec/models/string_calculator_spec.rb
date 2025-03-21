require 'rspec'
require_relative '../../app/models/string_calculator'

RSpec.describe StringCalculator do
  describe "calling class StringCalculator add method for sum numbers in the string." do
    # Test case 1:
    it "returns 0 for an empty string." do
      expect(StringCalculator.add("")).to eq(0)
    end

    # Test case 2:
    it "returns the given number passed as an argument as a string." do
      expect(StringCalculator.add("1")).to eq(1)
    end

    # Test case 3:
    it "sum and return the given string passed as an argument." do
      expect(StringCalculator.add("1,5")).to eq(6)
    end

    # Test case 4:
    it "allow the add method to handle any amount of numbers." do
      expect(StringCalculator.add("1,2,3,4,5,6,7,8,9")).to eq(45)
    end

    # Test case 5:
    it "remove the delimiter and sum the numbers." do
      expect(StringCalculator.add("//;\n1;2")).to eq(3)
    end

    # Test case 6:
    it "passing negative numbers in arguments will raise an exception." do
      expect(StringCalculator.add("1,-2,3")).to eq(6)
    end

    # Test case 7:
    it "handle new lines between numbers (instead of commas)." do
      expect(StringCalculator.add("1\n2,3")).to eq(6)
    end

    # Test case 8:
    it "passing multiple negative numbers in arguments will raise an exception." do
      expect(StringCalculator.add("1,-2,3,-7,9,-4")).to eq(6)
    end

    # Test case 9:
    it "numbers bigger than 1000 should be ignored." do
      expect(StringCalculator.add("2,1001")).to eq(2)
    end

    # Test case 10:
    it "remove the delimiter and sum the numbers in any length." do
      expect(StringCalculator.add("//[***]\n1***2***3")).to eq(6)
    end

    # Test case 11:
    it "allow multiple delimiters and numbers; remove the delimiter and sum the numbers." do
      expect(StringCalculator.add("//[*][%]\n1*2%3")).to eq(6)
    end
  end
end
