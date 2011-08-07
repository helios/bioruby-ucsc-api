# = rmsk.rb
# Copyright::
#  Copyright (C) 2011 MISHIMA, Hiroyuki <missy at be.to / hmishima at nagasaki-u.ac.jp> 
# License::     The Ruby licence (Ryby's / GPLv2 dual)
#
# In the hg18 database, the Rmsk table is actually separated
# into "chr1_rmsk", "chr2_rmsk", etc. The Rmsk class dynamically
# define Rmsk::Chr1_Rmsk, Rmsk::Chr2_Rmsk, etc. The
# Rmsk.find_by_interval calls an appropreate class automatically.

module Bio
  module Ucsc
    module Mm9

      class Rmsk
        %w(ChrM Chr1 Chr2 Chr3 Chr4 Chr5 Chr6 Chr7 Chr8 Chr9
Chr10 Chr11 Chr12 Chr13 Chr14 Chr15 Chr16 Chr17 Chr18 Chr19
Chr20 Chr21 Chr22 ChrX ChrY).each do |chr|
          class_eval %!
            class #{chr}_Rmsk < DBConnection
              set_table_name "#{chr.downcase}_rmsk"
              set_primary_key nil

              def self.find_by_interval(interval, opt = {:partial => true})
                find_first_or_all_by_interval(interval, :first, opt)
              end
        
              def self.find_all_by_interval(interval, opt = {:partial => true})
                find_first_or_all_by_interval(interval, :all, opt)
              end

              def self.find_first_or_all_by_interval(interval, first_all, opt)
                zstart = interval.zero_start
                zend   = interval.zero_end
                if opt[:partial] == true
                  where = <<-SQL
      genoName = :chrom
AND   bin in (:bins)
AND ((genoStart BETWEEN :zstart AND :zend)
 OR  (genoEnd BETWEEN :zstart AND :zend)
 OR  (genoStart <= :zstart AND genoEnd >= :zend))
                  SQL
                else
                  where = <<-SQL
      genoName = :chrom
AND   bin in (:bins)
AND ((genoStart BETWEEN :zstart AND :zend)
AND  (genoEnd BETWEEN :zstart AND :zend))
                  SQL
                end
                cond = {
                  :chrom  => interval.chrom,
                  :bins   => Bio::Ucsc::UcscBin.bin_all(zstart, zend),
                  :zstart => zstart,
                  :zend   => zend,
                }
                self.find(first_all,
                          :select => "*",
                          :conditions => [where, cond],)
              end
            end
          !
        end # each chromosome

        def self.find_by_interval(interval, opt = {:partial => true})
          chr_klass = self.const_get("#{interval.chrom.capitalize}_Rmsk")
          chr_klass.__send__(:find_by_interval, interval, opt)
        end

        def self.find_all_by_interval(interval, opt = {:partial => true})
          chr_klass = self.const_get("#{interval.chrom.capitalize}_Rmsk")
          chr_klass.__send__(:find_all_by_interval, interval, opt)
        end
      end # class Rmsk

    end # module Hg18 
  end # module Ucsc
end # module Bio
