# Implements a conversion factor for accelerometer data

require 'cosmos/conversions/conversion'

module Cosmos

  class AccelConvertY < Conversion

    def call(value, packet, buffer)

      # Saturation
      saturate = packet.read("SAT",:RAW)  # convert SAT item in packet to string
   
      # Determine if field is saturated
      satField = ((saturate >> 4) & 1) 

      highField = ((saturate >> 7) & 1)

      #Shift left
      mult = 0.0000616 * (1<<(3*satField)) * ((0.258*highField)+1)

      return value * mult # Output
      	
    end
  end
end