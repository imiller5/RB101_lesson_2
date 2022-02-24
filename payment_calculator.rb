# get loan amount from user
# get Annual Percentage Rate (APR) from user
# get loan duration from user (in months)
# calc monthly interest rate
# calc mothly payment
# output the result to the user

require 'pry'

def prompt(message)
  puts("=> #{message}")
end

def valid_number?(num)
  num.to_i.to_s == num
end

prompt("Welcome to Loan Calculator!!")

loop do
  loan_amount = ''
  prompt("Enter loan amount:")
  loop do
    loan_amount = gets.chomp
    if valid_number?(loan_amount) && loan_amount.to_i > 0
      break
    else
      prompt("Please enter valid number greater than 0")
    end
  end

  interest_rate = ''
  prompt("Enter Annual Percentage Rate Example: 5% = 5, 3.5% = 3.5:")
  loop do
    interest_rate = gets.chomp
    if interest_rate.empty? || interest_rate.to_f < 0
      prompt("Please enter a positive number")
    else
      break
    end
  end

  prompt("Enter the loan durtion in months.")

  months = ''
  loop do
    months = gets.chomp
    if months.empty? || months.to_i < 0
      prompt("Please enter a valid number")
    else
      break
    end
  end

  annual_interest_rate = interest_rate.to_f / 100
  monthly_interest_rate = annual_interest_rate / 12

  monthly_payment = loan_amount.to_i *
                    (monthly_interest_rate /
                    (1 - (1 + monthly_interest_rate)**(-months.to_i)))

  prompt("Your monthly payment is: $#{format('%.2f', monthly_payment)}")

  prompt("Would you like to do another calculation? (Y if yes)")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt("Thank you for using Loan Calculator!")
prompt("Good bye!")
