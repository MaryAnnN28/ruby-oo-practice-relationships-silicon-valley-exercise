class Startup

     attr_accessor :name
     attr_reader
     
     @@all = []

     def initialize(name)
          @name = name

          self.class.all << self
          # @@all << self
     end

     




end
