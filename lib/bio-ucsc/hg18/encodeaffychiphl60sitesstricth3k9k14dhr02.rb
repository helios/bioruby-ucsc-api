# -*- coding: utf-8 -*-
# = hg18/encodeaffychiphl60sitesstricth3k9k14dhr02.rb
# Copyright::
#  Copyright (C) 2011 MISHIMA, Hiroyuki
#                <missy at be.to / hmishima at nagasaki-u.ac.jp> 
# License::     The Ruby licence (Ryby's / GPLv2 dual)
#
# = Table desfription in UCSC Table Browser
# Affy Strict Sites - Affymetrix ChIP-chip (HL-60 and ME-180 cells)
# Strict Sites
#
# = ommitted dynamic method(s) due to the method name collision
#  none

module Bio
  module Ucsc
    module Hg18
      class EncodeAffyChIpHl60SitesStrictH3K9K14DHr02 < DBConnection
        extend Bio::Ucsc::Hg18::QueryUsingChrom
        set_table_name 'encodeAffyChIpHl60SitesStrictH3K9K14DHr02'
        set_primary_key nil
      end 
    end # module Hg18
  end # module Ucsc
end # Bio
