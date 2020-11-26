
class Startup

     attr_accessor :name 
     attr_reader :founder, :domain
     
     @@all = []

     # returns a **string** that is the startup's name
     # returns a **string** that is the founder's name
     # .....Once a startup is created, the founder cannot be changed.
     # returns a **string** that is the startup's domain

     def initialize(name, founder, domain)
          @name = name
          @founder = founder
          @domain = domain

          self.class.all << self
          # @@all << self
     end


     # given a string of a **domain** and a string of a **name**, 
     # change the domain and name of the startup. This is the only 
     # public method through which the domain should be changed.

     def pivot(domain, name)
          self.domain = domain
          self.name = name 
     end


     # should return **all** of the startup instances
     def self.all
          @@all
     end

     # given a string of a **founder's name**, returns the 
     # **first startup** whose founder's name matches
    def self.find_by_founder(founder)
        self.all.find do |startup| 
            startup.founder == founder  #founder instead of self, because it wanted just that ONE founder's startup
        end
    end

    # Startup.domains should return an array of all the different startup domains
    def self.domains
        all_domains = []
        self.all.select do |startup| 
            all_domains << startup.domain
        end
        all_domains
    end
    # also this works... shorter way
    # def self.domains
    #   Startup.all.map { |startup| startup.domain }
    # end


    # Startup#sign_contract - given a **venture capitalist object**
    # type of investment (as a string), & amount invested (float). creates
    # a new funding round and associates it with that startup and 
    # venture capitalist. 

    def sign_contract(type, investment, venture_capitalist)
        FundingRound.new(self, type, investment, venture_capitalist)
    end


    ### CREATED HELPER METHOD TO HELP WITH BELOW METHODS. 
    def funding_rounds
        FundingRound.all.select { |funding_round| funding_round.startup == self } 
    end

    # returns the TOTAL >NUMBER< of funding rounds that the startup has gotten
    # Used 'helper method' above to make running other methods more efficient
    def num_funding_rounds
        self.funding_rounds.count 
    end

    # Returns the TOTAL SUM of investments that the startup has gotten 
    def total_funds 
        self.funding_rounds.sum { |funding_round| funding_round.investment }
    end

    # Returns *UNIQ* array of all venture capitalists that have invested in this company
    def investors
        self.funding_rounds.select { |investor| investor.venture_capitalist }.uniq
    end

    # Returns a *UNIQ* array of all venture capitalists that have invested in 
    # this company and are in the Tres Commas club
    # ** USED INVESTORS METHOD ABOVE
    def big_investors
        mvp_investor = []
        investors.select do |investor| 
            if VentureCapitalist.tres_commas_club.include?(investor)
                mvp_investor << VentureCapitalist
            end
        end
        mvp_investor
    end
      ## ASK INSTRUCTOR OR COACH FOR HELP. KEEPS RETURNING EMPTY ARRAY
    










     
end



# HAHAHA IMA TAKE OVER NOW >:)
# lol is anyone onlline!?!?!
# well i think you left this on? 
# remember to not burnout, brain burnout is a real thing
# make sure to rest lol and eat 

