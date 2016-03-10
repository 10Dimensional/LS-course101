def valid_number?(num)
  num == num.to_i.to_s || num == num.to_f.to_s # returns true/false
end

Kernel.puts("Welcome to the Mortgage Calculator! Please enter your name.")

name = ''
loop do
  name = Kernel.gets().chomp()
  if name.empty?()
    prompt("Make sure to use a valid name.")
  else
    break
  end
end

loop do # main loop
  loanAmount = 0
  duration = 0
  apr = 0.0
  
  Kernel.puts("Hi #{name}! Please enter your loan amount.")
  
  loop do
    loanAmount = Kernel.gets().chomp()
    
    if valid_number?(loanAmount)
      Kernel.puts(loanAmount)
      break
    else 
      Kernel.puts("Please enter a valid loan amount.")
    end
  end
  
  Kernel.puts("Please enter the APR for your loan.")
  
  loop do
    apr = Kernel.gets().chomp()
  end
  
end 