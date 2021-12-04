def compute
  return "Does not compute." if !block_given?
  yield
end

# test cases
p compute { 5 + 3 } # 8
p compute { 'a' + 'b' } # 'ab'
p compute # 'Does not compute.'
