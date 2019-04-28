# Implements a conversion factor for accelerometer data

require 'cosmos/conversions/conversion'

module Cosmos

  class AccelConversion < Conversion
  
    def initialize(multiplier) # define the value passed in with the function(?)
      #super()
      @multiplier = multiplier.to_f
    end 
           
    def call(value, packet, buffer)
      packetString = packet.read('SAT').to_s  # convert SAT item in packet to string   
         
      if multiplier == 1              # X
        if packetString[4] == 1       # Course accel sensor
          conversionFactor = 0.00305  # Hi-G factor
        elseif packetString[7] == 1   # Fine accel sensor
          conversionFactor = 0.000493 # Course accel factor
        else
          conversionFactor = 0.000062 # Fine accel factor
        end
      elseif multiplier == 2          # Y
        if packetString[5] == 1       # Course accel sensor
          conversionFactor = 0.00305  # Hi-G factor
        elseif packetString[8] == 1   # Fine accel sensor
          conversionFactor = 0.000493 # Course accel factor
        else
          conversionFactor = 0.000062 # Fine accel factor
        end
      else                            # Z
        if packetString[6] == 1       # Course accel sensor
          conversionFactor = 0.00305  # Hi-G factor
        elseif packetString[9] == 1   # Fine accel sensor
          conversionFactor = 0.000493 # Course accel factor
        else
          conversionFactor = 0.000062 # Fine accel factor
        end
      end
      
      return value * conversionFactor # Output
      	
    end
  end
end