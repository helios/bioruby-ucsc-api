# -*- coding: utf-8 -*-
# = hg18/wgencodeutachipseqbaseoverlapsignalgm12892ctcf.rb
# Copyright::
#  Copyright (C) 2011 MISHIMA, Hiroyuki
#                <missy at be.to / hmishima at nagasaki-u.ac.jp> 
# License::     The Ruby licence (Ryby's / GPLv2 dual)
#
# = Table desfription in UCSC Table Browser
# Open Chromatin - ENCODE Open Chromatin, Duke/UNC/UT
#
# = ommitted dynamic method(s) due to the method name collision
#  none

module Bio
  module Ucsc
    module Hg18
      class WgEncodeUtaChIPseqBaseOverlapSignalGm12892Ctcf < DBConnection
        extend Bio::Ucsc::Hg18::QueryUsingChromBin
        set_table_name 'wgEncodeUtaChIPseqBaseOverlapSignalGm12892Ctcf'
        set_primary_key nil
      end 
    end # module Hg18
  end # module Ucsc
end # Bio
