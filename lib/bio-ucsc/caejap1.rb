#
# = AUTOMATIC Table Definition of the C. japonica Mar. 2008 (WUGSC 3.0.2/caeJap1) assembly
# Copyright::   Copyright (C) 2011
#               MISHIMA, Hiroyuki
#               <missy at be.to / hmishima at nagasaki-u.ac.jp> 
# License::     The Ruby licence (Ryby's / GPLv2 dual)
#

require "#{::File.dirname(__FILE__)}/db_connector"
require "#{::File.dirname(__FILE__)}/table_class_detector"

module Bio
  module Ucsc
    module CaeJap1
      CHROMS = %w(chrUn)

      extend TableClassDetector
      include DBConnector
      DBConnection.database "caeJap1"

      base = "#{::File.dirname(__FILE__)}/caejap1"
      autoload :ChainCe6, "#{base}/chaince6"
      autoload :ChainCe6Link, "#{base}/chaince6link"
      autoload :Gap, "#{base}/gap"
      autoload :Gold, "#{base}/gold"
    end
  end
end
