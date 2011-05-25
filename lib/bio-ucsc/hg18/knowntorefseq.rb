# -*- coding: utf-8 -*-
# = hg18/GenBank IMAGE clone info
# Copyright::
#  Copyright (C) 2011 MISHIMA, Hiroyuki <missy at be.to / hmishima at nagasaki-u.ac.jp> 
# License::     The Ruby licence (Ryby's / GPLv2 dual)
#
# = Table desfription in UCSC Table Browser 
# warnings about particular clones in GenBank
#
# = ommitted dynamic method(s) due to the method name collision
#  none

module Bio
  module Ucsc
    module Hg18
      class KnownToRefSeq < DBConnection
        set_table_name 'knownToRefSeq'
        set_primary_key nil
      end 
    end # module Hg18
  end # module Ucsc
end # Bio
