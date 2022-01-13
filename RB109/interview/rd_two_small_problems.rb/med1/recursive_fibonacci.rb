def fibonacci(nth)
  if nth <= 2 
    return 1 
  else
    fibonacci(nth-1) + fibonacci(nth-2)
  end
end

p fibonacci(2)