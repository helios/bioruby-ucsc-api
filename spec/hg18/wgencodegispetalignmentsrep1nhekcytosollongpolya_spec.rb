require 'bio-ucsc'
describe "Bio::Ucsc::Hg18::WgEncodeGisPetAlignmentsRep1NhekCytosolLongpolya" do 

  describe "#first" do
    context "given without value" do
      it 'returns a record (r.fileName)' do
        Bio::Ucsc::Hg18::DBConnection.default
        Bio::Ucsc::Hg18::DBConnection.connect
        r = Bio::Ucsc::Hg18::WgEncodeGisPetAlignmentsRep1NhekCytosolLongpolya.first
        r.fileName.should be_true
      end
    end
  end

end