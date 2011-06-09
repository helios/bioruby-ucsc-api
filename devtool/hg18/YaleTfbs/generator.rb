#!/usr/local/bin/ruby-1.9

require 'erb'
require 'fileutils'

HEADER = "      ## track: Yale TFBS"

TABLES = %w(
wgEncodeYaleChIPseqPeaksGm12878CfosV3
wgEncodeYaleChIPseqPeaksGm12878Cjun
wgEncodeYaleChIPseqPeaksGm12878Cmyc
wgEncodeYaleChIPseqPeaksGm12878JundV2
wgEncodeYaleChIPseqPeaksGm12878MaxV3
wgEncodeYaleChIPseqPeaksGm12878NfkbTnfa
wgEncodeYaleChIPseqPeaksGm12878NfkbIggrab
wgEncodeYaleChIPseqPeaksGm12878Pol2V3
wgEncodeYaleChIPseqPeaksGm12878Pol2Musigg
wgEncodeYaleChIPseqPeaksGm12878Pol3
wgEncodeYaleChIPseqPeaksGm12878Rad21Iggrab
wgEncodeYaleChIPseqPeaksGm12878Tr4
wgEncodeYaleChIPseqPeaksGm12878Yy1
wgEncodeYaleChIPseqPeaksGm12878Zzz3
wgEncodeYaleChIPseqPeaksK562Atf3
wgEncodeYaleChIPseqPeaksK562Bdp1
wgEncodeYaleChIPseqPeaksK562Brf1
wgEncodeYaleChIPseqPeaksK562Brf2
wgEncodeYaleChIPseqPeaksK562Brg1Musigg
wgEncodeYaleChIPseqPeaksK562CfosV2
wgEncodeYaleChIPseqPeaksK562CjunV2
wgEncodeYaleChIPseqPeaksK562CmycV2
wgEncodeYaleChIPseqPeaksK562bE2f4
wgEncodeYaleChIPseqPeaksK562bE2f6
wgEncodeYaleChIPseqPeaksK562bGata1V2
wgEncodeYaleChIPseqPeaksK562bGata2
wgEncodeYaleChIPseqPeaksK562Gtf2b
wgEncodeYaleChIPseqPeaksK562Ini1Musigg
wgEncodeYaleChIPseqPeaksK562JundV2
wgEncodeYaleChIPseqPeaksK562MaxV2
wgEncodeYaleChIPseqPeaksK562Nelfe
wgEncodeYaleChIPseqPeaksK562Nfe2V2
wgEncodeYaleChIPseqPeaksK562Pol2V2
wgEncodeYaleChIPseqPeaksK562Pol2Musigg
wgEncodeYaleChIPseqPeaksK562Pol3
wgEncodeYaleChIPseqPeaksK562Rad21
wgEncodeYaleChIPseqPeaksK562Rpc155
wgEncodeYaleChIPseqPeaksK562bSetdb1
wgEncodeYaleChIPseqPeaksK562bSetdb1Mnase
wgEncodeYaleChIPseqPeaksK562Sirt6
wgEncodeYaleChIPseqPeaksK562Tfiiic
wgEncodeYaleChIPseqPeaksK562bTr4
wgEncodeYaleChIPseqPeaksK562Xrcc4
wgEncodeYaleChIPseqPeaksK562bYy1
wgEncodeYaleChIPseqPeaksK562bZnf263V2
wgEncodeYaleChIPseqPeaksK562bZnf274
wgEncodeYaleChIPseqPeaksHuvecCjun
wgEncodeYaleChIPseqPeaksHuvecMax
wgEncodeYaleChIPseqPeaksHuvecPol2
wgEncodeYaleChIPseqPeaksHelas3Ap2alpha
wgEncodeYaleChIPseqPeaksHelas3Ap2gamma
wgEncodeYaleChIPseqPeaksHelas3Baf155Musigg
wgEncodeYaleChIPseqPeaksHelas3Baf170Musigg
wgEncodeYaleChIPseqPeaksHelas3Bdp1
wgEncodeYaleChIPseqPeaksHelas3Brf1
wgEncodeYaleChIPseqPeaksHelas3Brf2
wgEncodeYaleChIPseqPeaksHelas3Brg1Iggmus
wgEncodeYaleChIPseqPeaksHelas3Cfos
wgEncodeYaleChIPseqPeaksHelas3CjunRabigg
wgEncodeYaleChIPseqPeaksHelas3Cmyc
wgEncodeYaleChIPseqPeaksHelas3E2f1
wgEncodeYaleChIPseqPeaksHelas3Ha
wgEncodeYaleChIPseqPeaksHelas3E2f4
wgEncodeYaleChIPseqPeaksHelas3E2f6
wgEncodeYaleChIPseqPeaksHelas3Ini1Musigg
wgEncodeYaleChIPseqPeaksHelas3JundRabigg
wgEncodeYaleChIPseqPeaksHelas3Max
wgEncodeYaleChIPseqPeaksHelas3Nrf1Musigg
wgEncodeYaleChIPseqPeaksHelas3Pol2V2
wgEncodeYaleChIPseqPeaksHelas3Rpc155
wgEncodeYaleChIPseqPeaksHelas3Tfiiic
wgEncodeYaleChIPseqPeaksHelas3Tr4
wgEncodeYaleChIPseqPeaksHelas3Largefragment
wgEncodeYaleChIPseqPeaksHelas3Mouseigg
wgEncodeYaleChIPseqPeaksHepg2bTr4
wgEncodeYaleChIPseqPeaksGm10847NfkbIggrab
wgEncodeYaleChIPseqPeaksGm10847Pol2Musigg
wgEncodeYaleChIPseqPeaksGm12891NfkbIggrab
wgEncodeYaleChIPseqPeaksGm12891Pol2Musigg
wgEncodeYaleChIPseqPeaksGm12892NfkbIggrab
wgEncodeYaleChIPseqPeaksGm12892Pol2Musigg
wgEncodeYaleChIPseqPeaksGm15510NfkbIggrab
wgEncodeYaleChIPseqPeaksGm15510Pol2Musigg
wgEncodeYaleChIPseqPeaksGm18505NfkbIggrab
wgEncodeYaleChIPseqPeaksGm18505Pol2Musigg
wgEncodeYaleChIPseqPeaksGm18526NfkbIggrab
wgEncodeYaleChIPseqPeaksGm18526Pol2Musigg
wgEncodeYaleChIPseqPeaksGm18951NfkbIggrab
wgEncodeYaleChIPseqPeaksGm18951Pol2Musigg
wgEncodeYaleChIPseqPeaksGm19099NfkbIggrab
wgEncodeYaleChIPseqPeaksGm19099Pol2Musigg
wgEncodeYaleChIPseqPeaksGm19193NfkbIggrab
wgEncodeYaleChIPseqPeaksGm19193Pol2Musigg
wgEncodeYaleChIPseqPeaksHct116Pol2
wgEncodeYaleChIPseqPeaksHct116Tcf4V2
wgEncodeYaleChIPseqPeaksHek293Pol2V2
wgEncodeYaleChIPseqPeaksMcf7Hae2f1
wgEncodeYaleChIPseqPeaksNb4Pol2V2
wgEncodeYaleChIPseqPeaksNt2d1Suz12
wgEncodeYaleChIPseqPeaksNt2d1Yy1
wgEncodeYaleChIPseqPeaksHepg2CebpbForskln
wgEncodeYaleChIPseqPeaksHepg2ErraForskln
wgEncodeYaleChIPseqPeaksHepg2Grp20Forskln
wgEncodeYaleChIPseqPeaksHepg2Hnf4aForskln
wgEncodeYaleChIPseqPeaksHepg2Hsf1Forskln
wgEncodeYaleChIPseqPeaksHepg2Pgc1aForskln
wgEncodeYaleChIPseqPeaksHepg2Pol2Forskln
wgEncodeYaleChIPseqPeaksHepg2Srebp1aInsln
wgEncodeYaleChIPseqPeaksHepg2Pol2
wgEncodeYaleChIPseqPeaksHepg2Srebp1a
wgEncodeYaleChIPseqPeaksHepg2Srebp2
wgEncodeYaleChIPseqPeaksHelas3ifngStat1
wgEncodeYaleChIPseqPeaksK562Ifna30Cmyc
wgEncodeYaleChIPseqPeaksK562Ifna30Pol2
wgEncodeYaleChIPseqPeaksK562Ifna30Stat1
wgEncodeYaleChIPseqPeaksK562Ifna30Stat2
wgEncodeYaleChIPseqPeaksK562Ifna6hCjun
wgEncodeYaleChIPseqPeaksK562Ifna6hCmyc
wgEncodeYaleChIPseqPeaksK562Ifna6hPol2
wgEncodeYaleChIPseqPeaksK562Ifna6hStat1
wgEncodeYaleChIPseqPeaksK562Ifna6hStat2
wgEncodeYaleChIPseqPeaksK562Ifng30Cjun
wgEncodeYaleChIPseqPeaksK562Ifng30Pol2
wgEncodeYaleChIPseqPeaksK562Stat1Ifng30
wgEncodeYaleChIPseqPeaksK562Ifng6hCjun
wgEncodeYaleChIPseqPeaksK562Ifng6hCmyc
wgEncodeYaleChIPseqPeaksK562Ifng6hPol2
wgEncodeYaleChIPseqPeaksK562Stat1Ifng6h
)

temp_spec = "template_spec.txt"
temp_auto = "template_auto.txt"
temp_main = "template_main.txt"

FileUtils.mkdir_p("Specs") unless FileTest.exist?("Specs")
FileUtils.mkdir_p("Libs") unless FileTest.exist?("Libs")

TABLES.each do |tab|
  table_name  = tab
  klass_name  = tab[0].upcase << tab[1..-1]
  script_name = tab.downcase

  open("Specs/#{script_name}_spec.rb", "w") do |writer|
    erb = ERB.new File.read(temp_spec)
    writer.puts erb.result binding
  end

  open("Libs/#{script_name}.rb", "w") do |writer|
    erb = ERB.new File.read(temp_main)
    writer.puts erb.result binding
  end
end

open("autoload_snippet.rb", 'w') do |writer|
  writer.puts HEADER
  TABLES.each do |tab|
    table_name  = tab
    klass_name  = tab[0].upcase << tab[1..-1]
    script_name = tab.downcase
    erb = ERB.new File.read(temp_auto)
    writer.puts erb.result binding
  end
end
