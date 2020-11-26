require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console


startup1 = Startup.new("The gram", "Kevin Systrom", "igram.tech")
startup2 = Startup.new("Pinboard", "Ben Silbermann", "pinboard.de")
startup3 = Startup.new("Bed and Breakfast Rentals", "Brian Chesky", "bnbrentals.com")

vc1 = VentureCapitalist.new("Sequoia Capital", 2100000000)
vc2 = VentureCapitalist.new("Accel Partners", 800000000)
vc3 = VentureCapitalist.new("First Round Capital", 1500000000)

rd1 = FundingRound.new("Angel", 10000000, startup1, vc1)
rd2 = FundingRound.new("Seed", 30000000, startup2, vc2)
rd3 = FundingRound.new("Series A", 20000000, startup3, vc3)
rd4 = FundingRound.new("Series B", 14000000, startup2, vc1)

startup1.sign_contract(vc3, "Series B", 5000000)
startup2.sign_contract(vc1, "Series A", 2000000)

binding.pry
0 #leave this here to ensure binding.pry isn't the last line