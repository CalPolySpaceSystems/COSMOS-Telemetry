# Implements a conversion factor based on the MPXH6400A pressure sensor spec
# The conversion assumes in input voltage of 5.0V and outputs in kPa

require 'cosmos/conversions/conversion'

module Cosmos
  class PressureTapsConversion < Conversion
    def call(value, packet, buffer)
			return (((5.0 / value) + 0.00842) / 0.002421)	
    end
  end
end
