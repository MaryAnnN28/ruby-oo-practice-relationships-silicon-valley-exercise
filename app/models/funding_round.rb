class FundingRound

     attr_accessor 
     attr_reader :startup, :venture_capitalist

     @@all = []

     def initialize(type, investment)
          @type = type
          @investment = investment
          @startup = startup
          @venture_capitalist = venture_capitalist

          self.class.all << self
     end

     def self.all
          @@all
     end

     def startup
     end

     def venture_capitalist
     end

     def type
          self.type.select { |funding_type| funding_type.type == self }
     end


end


