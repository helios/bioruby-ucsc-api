require 'bio-ucsc'
describe "Bio::Ucsc::Hg18::OmimMorbidMap" do 

  describe "#find_by_omimId" do
    context 'given 609300' do
      it 'returns a result (r.location == "10q24.3")' do
        Bio::Ucsc::Hg18::DBConnection.default
        Bio::Ucsc::Hg18::DBConnection.connect
        r = Bio::Ucsc::Hg18::OmimMorbidMap.find_by_omimId(609300)
        r.location.should == "10q24.3"
      end
    end
  end

end