# ask the user for two numbers
# ask the user for an operation to perform
# perform the operation with their input
# output the result

# answer = Kernel.gets()
# Kernel.puts(answer)

Kernel.puts("Welcome to the Calculator!")

Kernel.puts("What's the first number?")
number1 = Kernel.gets().chomp()

Kernel.puts("What's the second number?")
number2 = Kernel.gets().chomp()

Kernel.puts("What operation would you like to perform? 1) add 2) subtract 3) multiply 4) divide")
operator = Kernel.gets().chomp()

if operator == '1' #true
  result = puts(number1.to_i + number2.to_i)
elsif operator == '2'
  result = puts(number1.to_i - number2.to_i)
elsif operator == '3'
  result = puts(number1.to_i * number2.to_i)
elsif operator == '4'
  result = puts(number1.to_f / number2.to_f) #converting to floats
end
  
