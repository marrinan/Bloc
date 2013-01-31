FancyCalc.rb

def add(num1, num2)
  result = num1 + num2
  "The sum of #{ num1 } and #{ num2 } is #{ result }."
end

def subtract(num1, num2)
  result = num1 - num2
  "The difference of #{ num1 } and #{ num2 } is #{ result }."
end

def multiply(num1, num2)
  result = num1 * num2
  "The product of #{ num1 } and #{ num2 } is #{ result }."
end

def divide(num1, num2)
  result = num1.to_f / num2.to_f
  "The quotient of #{ num1 } and #{ num2 } is #{ result }."
end
