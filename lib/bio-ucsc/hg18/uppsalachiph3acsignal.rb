# -*- coding: utf-8 -*-
# = hg18/uppsalachiph3acsignal.rb
# Copyright::
#  Copyright (C) 2011 MISHIMA, Hiroyuki <missy at be.to / hmishima at nagasaki-u.ac.jp> 
# License::     The Ruby licence (Ryby's / GPLv2 dual)
#
# = Table description in UCSC Table Browser
# UU ChIP Signal - Uppsala University ChIP-chip Signal 
#
# = ommitted dynamic method(s) due to the method name collision
#  none

module Bio
  module Ucsc
    module Hg18
      class UppsalaChipH3acSignal < DBConnection
        extend Bio::Ucsc::Hg18::QueryUsingChromBin
        set_table_name 'uppsalaChipH3acSignal'
        set_primary_key nil
      end 
    end # module Hg18
  end # module Ucsc
end # Bio
