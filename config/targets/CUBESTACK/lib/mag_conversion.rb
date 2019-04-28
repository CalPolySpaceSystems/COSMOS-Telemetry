# Implements a conversion factor for magnatometer data

require 'cosmos/conversions/conversion'

module Cosmos
  class MagConversion < Conversion
    def call(value, packet, buffer)
		  return (value*4.0) / 32768.0	
    end
  end
end