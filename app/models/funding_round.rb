class FundingRound

     attr_accessor :type, :investment
     attr_reader :startup, :venture_capitalist

     @@all = []
     
     # startup = returns the startup object for that given funding round. 
     # Once a funding round is created, should not be able to change startup
     # venture_capitalist = returns the venture capitalist object for that given
     # funding round. Cannot change vc once created. 

     def initialize(type, investment, startup, venture_capitalist)
          @type = type
          @investment = investment
          @startup = startup
          @venture_capitalist = venture_capitalist

          self.class.all << self
     end

     def self.all
          @@all
     end


end


