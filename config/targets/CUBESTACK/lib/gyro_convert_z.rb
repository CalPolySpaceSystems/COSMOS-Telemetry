# Implements a conversion factor for gyroscope data

require 'cosmos/conversions/conversion'

module Cosmos

  class GyroConvertZ < Conversion
           
    def call(value, packet, buffer)

        # Saturation
        saturate = packet.read("SAT", :RAW)  # convert SAT item in packet to string
    
        # Determine if field is saturated
        satField = ((saturate >> 2) & 1) 
  
        #Shift left
        mult = 0.00875 * (1<<(3*satField))
  
        return value * mult # Output

    end

  end

end