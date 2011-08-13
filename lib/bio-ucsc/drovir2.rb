#
# = AUTOMATIC Table Definition of the D. virilis Aug. 2005 (Agencourt prelim/droVir2) assembly
# Copyright::   Copyright (C) 2011
#               MISHIMA, Hiroyuki
#               <missy at be.to / hmishima at nagasaki-u.ac.jp> 
# License::     The Ruby licence (Ryby's / GPLv2 dual)
#

require "#{File.dirname(__FILE__)}/drovir2/db_connection"
require "#{File.dirname(__FILE__)}/table_class_detector"

module Bio
  module Ucsc
    module DroVir2
      CHROMS = %w() # many scaffolds

      extend TableClassDetector

      base = "#{File.dirname(__FILE__)}/drovir2"
    end
  end
end
