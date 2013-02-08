Leap_Years.rb

def leap_year?(year)
  if year % 4 == 0 && year % 100 > 0
    true
  elsif year % 400 == 0
    true
  else
    false
  end
end
