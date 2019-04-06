# Implements a conversion factor based on the MPXH6400A pressure sensor spec
# The conversion assumes in input voltage of 5.0V and outputs in kPa

require 'cosmos/conversions/conversion'

module Cosmos
  class AccelConversion < Conversion
    def initialize(saturation_pos)
      super()
      @saturation_pos = saturation_pos
    end        
    def call(value, packet, buffer)
      if saturation_pos == 1
        # check x saturation
        # define conversion factor
      else if saturation_pos == 2
        # check y sautration
        # define conversion factor
      else
        # check z saturation
        # define conversion factor
		  return value * #conversion factor	
    end
  end
end

#OLD CODE

# Implements a conversion factor based on the MPXH6400A pressure sensor spec
# The conversion assumes in input voltage of 5.0V and outputs in kPa

#require 'cosmos/conversions/conversion'

#module Cosmos
#  class AccelConversion < Conversion       
#    def call(value, packet, buffer)
#		  return (value*2.0) / 32768.0	
#    end
#  end
#end