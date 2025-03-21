# Ruby on Rails Project with RSpec for Test-Driven Development (TDD).

## Project Setup:
* Ruby version: 3.4.1

* Rails version: 8.0.2

## Installing RSpec:
```
bundle add rspec-rails --group development,test
rails generate rspec:install
```

## Creating model:
```
mkdir app/models
touch app/models/string_calculator.rb
```
# app/models/string_calculator.rb
In the StringCalculator class, The add method checks if the input string is empty returns 0; otherwise, it splits the string by ',', converts the parts to integers, and returns their sum.
```
class StringCalculator
  def self.add(numbers)
    return 0 if numbers.empty?
    numbers
  end
end
```
---

## Creating RSpec for test:
```
mkdir spec/models
touch spec/models/string_calculator_spec.rb
```
# spec/models/string_calculator_spec.rb
This RSpec test checks if the StringCalculator.add method returns 0 when given an empty string as input.
```
require 'rspec'
require_relative '../../app/models/string_calculator'

RSpec.describe StringCalculator do
  describe "sum numbers in string" do
    # Example for success:
    it "returns 0 for an empty string" do
      expect(StringCalculator.add("")).to eq(0)
    end

    # Example for failure:
    it "returns the sum of numbers ignoring spaces" do
      expect(StringCalculator.add(" 1 , 2 ")).to eq(3)
    end
  end
end
```

# For execute RSpec:
```
rspec ./spec/models/string_calculator_spec.rb
```

# Success case:
```
input: ""
output:
  .
  Finished in 0.00323 seconds (files took 0.12386 seconds to load)
  1 example, 0 failures
```

# Failure case
```
input: " 1 , 2 "
output: 
  Failures:
    1) StringCalculator sum numbers in string returns the sum of numbers ignoring spaces
       Failure/Error: expect(StringCalculator.add(" 1 , 2 ")).to eq(3)
       
         expected: 3
              got: " 1 , 2 "
```

# Snapshot
![image](https://github.com/user-attachments/assets/6cee7282-8743-46ae-bc03-3cac51581d39)

---
# Developed by Arputhavarnam M C
---
