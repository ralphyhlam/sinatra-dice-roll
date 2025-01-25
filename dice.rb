require "sinatra"
require "sinatra/reloader" 
require "better_errors"
require "binding_of_caller"

# Need this configuration for better_errors
use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')

get ("/") do 
  erb(:elephant)
end

get ("/dice/2/6") do
  first_die = rand(1..6)
  second_die = rand(1..6)
  sum = first_die + second_die

  @outcome_one = "#{first_die}"
  @outcome_two = "#{second_die}"

  erb(:two_six)
end

get ("/dice/2/10") do
  first_die = rand(1..10)
  second_die = rand(1..10)
  @outcome_one = "#{first_die}"
  @outcome_two = "#{second_die}"

  erb(:two_ten)
end

get("/dice/1/20") do
  first_die = rand(1..20)

  @outcome = "you rolled #{first_die}"

  erb(:one_twenty)

end

get("/dice/5/4") do
  @rolls = []
  first_die = rand(1..4)
  @rolls.push(first_die)

  second_die = rand(1..4)
  @rolls.push(second_die)

  third_die = rand(1..4)
  @rolls.push(third_die)

  fourth_die = rand(1..4)
  @rolls.push(fourth_die)

  fifth_die = rand(1..4)
  @rolls.push(fifth_die)


  erb(:five_four)
end

get("/dice/100/6") do 
  @rolls = []

  100.times do 
    die = rand(1..6)
    @rolls.push(die)
  end

  erb(:onehundred_six)
end
    
