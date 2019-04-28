# Implements a conversion factor for gyroscope data

require 'cosmos/conversions/conversion'

module Cosmos

  class GyroConversion < Conversion
  
    def initialize(multiplier) # define the value passed in with the function(?)
      #super()
      @multiplier = multiplier.to_f
    end 
           
    def call(value, packet, buffer)
      packetString = packet.read('SAT').to_s  # convert SAT item in packet to string
      
      if multiplier == 1              # X
        if packetString[1] == 1       # Course gyro sensor
          conversionFactor = 0.07     # Course factor
        else                          # Fine gyro sensor
          conversionFactor = 0.00875  # Fine gyro factor
        end
      elseif multiplier == 2          # Y
        if packetString[2] == 1       # Course gyro sensor
          conversionFactor = 0.07     # Course factor
        else                          # Fine gyro sensor
          conversionFactor = 0.00875  # Fine gyro factor
        end
      else                            # Z
        if packetString[3] == 1       # Course gyro sensor
          conversionFactor = 0.07     # Course factor
        else                          # Fine gyro sensor
          conversionFactor = 0.00875  # Fine gyro factor
        end
      end
      
      return value * conversionFactor # Output
      	
    end
  end
end



#module Cosmos
#  class GyroConversion < Conversion
#    def call(value, packet, buffer)
#		  return (value*500.0) / 32768.0	
#    end
#  end
#end