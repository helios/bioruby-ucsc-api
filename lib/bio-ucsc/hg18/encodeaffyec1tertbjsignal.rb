# -*- coding: utf-8 -*-
# = hg18/encodeaffyec1tertbjsignal.rb
# Copyright::
#  Copyright (C) 2011 MISHIMA, Hiroyuki
#                <missy at be.to / hmishima at nagasaki-u.ac.jp> 
# License::     The Ruby licence (Ryby's / GPLv2 dual)
#
# = Table desfription in UCSC Table Browser
# Affy EC Signal - Affymetrix ENCODE Extension Transcription Signal
#
# = ommitted dynamic method(s) due to the method name collision
#  none

module Bio
  module Ucsc
    module Hg18
      class EncodeAffyEc1TertBJSignal < DBConnection
        extend Bio::Ucsc::Hg18::QueryUsingChromBin
        set_table_name 'encodeAffyEc1TertBJSignal'
        set_primary_key nil
      end 
    end # module Hg18
  end # module Ucsc
end # Bio
