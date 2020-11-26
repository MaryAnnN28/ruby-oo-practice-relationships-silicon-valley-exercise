class VentureCapitalist

     attr_reader :name, :total_worth

     @@all = []

     # returns a *string* that is the venture capitalist's name
     # returns a *string* that is the total worth of this inventor 
     def initialize(name, total_worth)
          @name = name
          @total_worth = total_worth

          @@all << self
     end

     # VentureCapitalist.all returns an array of all venture capitalists
     def self.all
          @@all
     end

     
     # VentureCapitalist.tres_commas_club returns an array of all venture 
     # capitalists in the Tres Commas club (more than $1,000,000 #total_worth)
     def self.tres_commas_club
          tres_club = []
          self.all.select do |venture_capitalist| 
               if venture_capitalist.total_worth > 1000000000
                    tres_club << venture_capitalist
               end
          end
          tres_club
     end

     #**SHORTER METHOD FOR ABOVE***
     # def self.tres_commas_club
     #   VentureCapitalist.all.filter { |vc| vc.total_worth >= 1000000000 }
     # end 


     # Given a *startup object*, type of investment, amount invested, 
     # creates new funding round & associates it with that startup
     # & venture capitalist. 
     def offer_contract(startup, type, investment)
          FundingRound.new(self, startup, type, investment)
     end

     # Returns an array of all funding rounds for that venture capitalist
     def funding_rounds
          FundingRound.all.select { |funding_round| funding_round.venture_capitalist == self }
     end

     # Returns a *uni* list of all startups this venture capitalist has funded 
     def portfolio
          self.funding_rounds.map {|startup_object| startup_object.startup}.uniq
     end

     # returns the largest funding round given by this venture capitalist
     def biggest_investment
          investments = self.funding_rounds.map {|biggest_inv| biggest_inv.investment}.max
     end

     # given a *domain string*, returns the total amount invested in that domain
     def invested(domain)
          Startup.all.find {|startup|startup.domain == domain}.funding_rounds.filter {|funding_round| funding_round.venture_capitalist == self}.sum {|fund_rd| fund_rd.investment}
     end









end
