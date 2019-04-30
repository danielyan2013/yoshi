class Gasstation < ApplicationRecord
  validates_presence_of :brand, :price, :lat, :lon
    attr_accessor(:stations)

    def nearby(user_lat, user_lon, radius)

      gasstations = Gasstation.all
  #    @todos = Todo.all

  #     gs_id = 0
       array_gs = []
    #   price_tester = 99999
    #   distances = []


       gasstations.each do |station|

         dis_tester = ((station.lat - user_lat)**2 + (station.lon - user_lon)**2)**(0.5)
         #distances << [station.id, dis_tester]
         if dis_tester < radius
            array_gs << station
         end
       end

       @stations  = array_gs
      # array_gs.each do |station|
        # if station.price < price_tester
           # price_tester = station.price
        # end
      # end

      # return price_tester
    end

    def cheapest
      stations.sort_by(&:price).first
    end

  end
