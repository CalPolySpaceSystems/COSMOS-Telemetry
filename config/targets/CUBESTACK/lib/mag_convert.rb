# Implements a conversion factor for gyroscope data

require 'cosmos/conversions/conversion'

module Cosmos

  class MagConvert < Conversion
  
    def call(value, packet, buffer)
      
      return value * 0.157 # Output
      	
    end
  end
end
