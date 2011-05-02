require 'bio-ucsc'
describe "Bio::Ucsc::Hg19::WgEncodeUwAffyExonArrayK562SimpleSignalRep1" do 

  describe "#find_by_interval" do
    context "given range chr1:1-20,000" do
      it "returns an array of records" do
        Bio::Ucsc::Hg19::DBConnection.default
        Bio::Ucsc::Hg19::DBConnection.connect
        i = Bio::GenomicInterval.parse("chr1:1-20,000")
        r = Bio::Ucsc::Hg19::WgEncodeUwAffyExonArrayK562SimpleSignalRep1.find_all_by_interval(i)
        r.should have(41).items
      end

      it 'returns a record (r.chrom == "chr1")' do
        Bio::Ucsc::Hg19::DBConnection.default
        Bio::Ucsc::Hg19::DBConnection.connect
        i = Bio::GenomicInterval.parse("chr1:1-20,000")
        r = Bio::Ucsc::Hg19::WgEncodeUwAffyExonArrayK562SimpleSignalRep1.find_by_interval(i)
        r.chrom.should == "chr1"
      end
    end
  end

end
