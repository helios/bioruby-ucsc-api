#
# = hg19.rb
# Copyright::   Cioyrught (C) 2011
#               MISHIMA, Hiroyuki <missy at be.to / hmishima at nagasaki-u.ac.jp> 
# License::     The Ruby licence (Ryby's / GPLv2 dual)

base = File.dirname(__FILE__)
require "#{base}/hg19/db_connection"
require "#{base}/hg19/activerecord"

module Bio 
  module Ucsc
    module Hg19
      base = File.dirname(__FILE__)
      autoload :Dgv,           "#{base}/hg19/dgv"
      autoload :Snp132Common,  "#{base}/hg19/snp132common"
      autoload :Snp132Flagged, "#{base}/hg19/snp132flagged"
      autoload :Snp131,        "#{base}/hg19/snp131"
      autoload :KnownGene,     "#{base}/hg19/knowngene"
      autoload :RefGene,       "#{base}/hg19/refgene"      
      autoload :GwasCatalog,   "#{base}/hg19/gwascatalog"
      autoload :CytoBand,      "#{base}/hg19/cytoband"
      autoload :OmimGene,      "#{base}/hg19/omimgene"
      autoload :WgRna,         "#{base}/hg19/wgrna"
      autoload :EnsGene,       "#{base}/hg19/ensgene"
    end
  end
end