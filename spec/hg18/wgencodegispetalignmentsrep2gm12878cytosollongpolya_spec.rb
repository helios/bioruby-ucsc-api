require 'bio-ucsc'
describe "Bio::Ucsc::Hg18::WgEncodeGisPetAlignmentsRep2Gm12878CytosolLongpolya" do 

  describe "#first" do
    context "given without value" do
      it 'returns a record (r.fileName)' do
        Bio::Ucsc::Hg18::DBConnection.default
        Bio::Ucsc::Hg18::DBConnection.connect
        r = Bio::Ucsc::Hg18::WgEncodeGisPetAlignmentsRep2Gm12878CytosolLongpolya.first
        r.fileName.should be_true
      end
    end
  end

end
