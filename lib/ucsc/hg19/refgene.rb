# -*- coding: utf-8 -*-
# = hg19/refgene.rb
# Copyright::
#  Copyright (C) 2011 MISHIMA, Hiroyuki <missy at be.to / hmishima at nagasaki-u.ac.jp> 
#  Copyright (C) 2008 Jan Aerts <jan.aerts@gmail.com>
# License::     The Ruby licence (Ryby's / GPLv2 dual)
#
# = Table desfription in UCSC Table Browser
# The RefSeq Genes track shows known human protein-coding and
# non-protein-coding genes taken from the NCBI RNA reference sequences
# collection (RefSeq). The data underlying this track are updated
# daily.
#
# = ommitted dynamic method(s) due to the method name collision
#  none

module Bio
  module Ucsc
    module Hg19
      class RefGene < DBConnection
        include Bio::Ucsc::Hg19::Feature
        extend Bio::Ucsc::Hg19::FindTxUsingBin
        set_table_name 'refGene'
        set_primary_key nil
      end # class RefGene
    end # module Hg19
  end # module Ucsc
end # Bio