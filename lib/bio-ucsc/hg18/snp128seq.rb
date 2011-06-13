#
# = hg18/snp128seq.rb
# Copyright::
#  Copyright (C) 2011 MISHIMA, Hiroyuki
#  <missy at be.to / hmishima at nagasaki-u.ac.jp> 
# License::     The Ruby licence (Ryby's / GPLv2 dual)
#
# = Table description in UCSC Table Browser
# Contains file offsets for reference SNP flanking sequences in a
# single fasta file.

module Bio
  module Ucsc
    module Hg18
      class Snp128Seq < DBConnection
        set_table_name 'snp128Seq'
        set_primary_key nil
       end
    end
  end
end
