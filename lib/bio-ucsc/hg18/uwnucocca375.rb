# -*- coding: utf-8 -*-
# = hg18/uwnucocca375.rb
# Copyright::
#  Copyright (C) 2011 MISHIMA, Hiroyuki <missy at be.to / hmishima at nagasaki-u.ac.jp> 
# License::     The Ruby licence (Ryby's / GPLv2 dual)
#
# = Table description in UCSC Table Browser
# Nucl Occ: A375 - UW Predicted Nucleosome Occupancy - A375
#
# = ommitted dynamic method(s) due to the method name collision
#  none

module Bio
  module Ucsc
    module Hg18
      class UwNucOccA375 < DBConnection
        extend Bio::Ucsc::Hg18::QueryUsingChromBin
        set_table_name 'uwNucOccA375'
        set_primary_key nil
      end 
    end # module Hg18
  end # module Ucsc
end # Bio
