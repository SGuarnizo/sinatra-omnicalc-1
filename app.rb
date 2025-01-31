require "sinatra"
require "sinatra/reloader"

get("/") do
  erb(:square)
end

get("/square/new") do
  erb(:square)
end

get("/square_root/new") do
  erb(:square_root)
end

get("/payment/new") do
  erb(:payment)
end

get("/random/new") do
  erb(:random)
end

get("/square/results") do
  @number = params.fetch("number").to_f
  @square = @number * @number
  erb(:results_square)
end

get("/square_root/results") do
  @number = params.fetch("number").to_f
  @square = Math.sqrt(@number)
  erb(:results_square_root)
end

get("/payment/results") do
  @apr = params.fetch("user_apr").to_f/100/12
  @years = params.fetch("user_years").to_f
  @principal = params.fetch("user_pv").to_f
  @payment = (@apr * @principal)/(1 - (1 + @apr) ** (-@years*12))
  @apr_outcome = "#{(@apr * 100 * 12).round(4)}%"
  @principal_outcome = @principal.to_fs(:currency)
  @payment_outcome = @payment.to_fs(:currency)
  erb(:results_payment)
end

get("/random/results") do
  @min = params.fetch("user_min").to_f
  @max = params.fetch("user_max").to_f
  @random = rand * (@max - @min) + @min
  erb(:results_random)
end
