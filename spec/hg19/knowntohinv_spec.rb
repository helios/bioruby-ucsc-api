require 'bio-ucsc'
describe "Bio::Ucsc::Hg19::KnownToHInv" do 

  describe "#find_by_name" do
    context 'given "uc004fon.1"' do
      it 'returns (r.mrnaAcc == "HIT000004659")' do
        Bio::Ucsc::Hg19::DBConnection.default
        Bio::Ucsc::Hg19::DBConnection.connect
        r = Bio::Ucsc::Hg19::KnownToHInv.find_by_name("uc004fon.1")
        r.value.should == "HIT000004659"
      end
    end
  end

end
