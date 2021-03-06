require 'bio-ucsc'
describe "Bio::Ucsc::Hg18::WgEncodeNhgriNRESilencersK562Ggamma" do 

  describe "#find_by_interval" do
    context "given range chr7:1-120,000,000" do
      it 'returns a record (r.chrom == "chr7")' do
        Bio::Ucsc::Hg18::DBConnection.default
        Bio::Ucsc::Hg18::DBConnection.connect
        i = Bio::GenomicInterval.parse("chr7:1-120,000,000")
        r = Bio::Ucsc::Hg18::WgEncodeNhgriNRESilencersK562Ggamma.find_by_interval(i)
        r.chrom.should == "chr7"
      end
    end
  end

end
