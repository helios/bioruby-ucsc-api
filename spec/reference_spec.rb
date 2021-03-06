require 'bio-ucsc'

describe "Bio::Ucsc::Reference" do 
  
  describe ".load" do
    context 'given "../samples/hg18.2bit"' do
      it "returns a Bio::Ucsc::Reference object" do
        ref = Bio::Ucsc::Reference.load("samples/hg18.2bit")
        ref.should be_kind_of Bio::Ucsc::Reference
      end
    end
  end

  describe "#header.signarue" do
    context 'given "../samples/hg18.2bit"' do
      it "returns 0x1A412743" do
        ref = Bio::Ucsc::Reference.load("samples/hg18.2bit")
        ref.header.signature.should == 0x1A412743
      end
    end
  end

  describe "#header.version" do
    context 'given "../samples/hg18.2bit"' do
      it "returns 0" do
        ref = Bio::Ucsc::Reference.load("samples/hg18.2bit")
        ref.header.version.should == 0
      end
    end
  end

  describe "#header.sequence_count" do
    context 'given "../samples/hg18.2bit"' do
      it "returns 0x5d" do
        ref = Bio::Ucsc::Reference.load("samples/hg18.2bit")
        ref.header.sequence_count.should == 49
      end
    end
  end

  describe '#offsets["chr1"]' do
    context 'given "../samples/hg18.2bit"' do
      it "returns 0x100bbd2b" do 
        ref = Bio::Ucsc::Reference.load("samples/hg18.2bit")
        ref.offsets["chr1"].should == 0x100bbd2b
      end
    end
  end

  describe "#records" do
    context 'given "chr1"' do
      it 'returns (TwoBitRecord.reserved == 0)' do
        ref = Bio::Ucsc::Reference.load("samples/hg18.2bit")
        ref.records("chr1").reserved == 0
      end
    end

    context 'given "chr1"' do
      it 'returns (TwoBitRecord.dna_size == 249_250_621)' do
        ref = Bio::Ucsc::Reference.load("samples/hg18.2bit")
        ref.records("chr1").dna_size.should == 247249719
      end
    end
  end

  describe "#byte_to_nucleotides" do
    context 'given 0b00011011' do
      it 'returns "TCAG"' do
        ref = Bio::Ucsc::Reference.load("samples/hg18.2bit")
        ref.__send__(:byte_to_nucleotides, 0b00011011).should == "TCAG"
      end
    end
  end

  describe "#bytes_to_nucleotides" do
    context 'given [0b00011011, 0b11100100]' do
      it 'returns "TCAGGACT"' do
        ary = [0b00011011, 0b11100100]
        ref = Bio::Ucsc::Reference.load("samples/hg18.2bit")
        ref.__send__(:bytes_to_nucleotides, ary).should == "TCAGGACT"
      end
    end
  end

  describe "#find_by_interval_raw" do
    context "given range chr1:1,000,000-1,000,030" do
      it 'returens "TACGTGGCTGCTCTCACACATGGGCCATGTG"' do
        ref = Bio::Ucsc::Reference.load("samples/hg18.2bit")
        itv = Bio::GenomicInterval.parse("chr1:1,000,000-1,000,030")
        ref.find_by_interval_raw(itv).should ==
          "TACGTGGCTGCTCTCACACATGGGCCATGTG"
      end
    end

    context "given range chr2:1,123,456-1,123,499" do
      it 'returens "TAATGGCATACATGTAGAAAATGCAACTCATGAAGAAGTGGTAA"' do
        ref = Bio::Ucsc::Reference.load("samples/hg18.2bit")
        itv = Bio::GenomicInterval.parse("chr2:1,123,456-1,123,499")
        ref.find_by_interval_raw(itv).should ==
          "TAATGGCATACATGTAGAAAATGCAACTCATGAAGAAGTGGTAA"
      end
    end

    context "given range chr2:1,123,456-1,123,456" do
      it 'returens "T"' do
        ref = Bio::Ucsc::Reference.load("samples/hg18.2bit")
        itv = Bio::GenomicInterval.parse("chr2:1,123,456-1,123,456")
        ref.find_by_interval_raw(itv).should == "T"
      end
    end
  end
    
  describe ".find_by_interval" do
    context "given range chr1:217,260-217,299" do
      it 'returns "NNNNNNNNNNNNNNNNNNNNNGATTCATGGCTGAAATCGT"' do
        ref = Bio::Ucsc::Reference.load("samples/hg18.2bit")
        itv = Bio::GenomicInterval.parse("chr1:217,260-217,299")
        ref.find_by_interval(itv).should ==
          "NNNNNNNNNNNNNNNNNNNNNGATTCATGGCTGAAATCGT"
      end
    end
    
    # N-block => chr1:267,720-317,719
    context "given range chr1:257,560-257,600" do
      it 'returns "CAGGCGCCCGCATCCAGCTGGATNNNNNNNNNNNNNNNNNN"' do
        ref = Bio::Ucsc::Reference.load("samples/hg18.2bit")
        itv = Bio::GenomicInterval.parse("chr1:257,560-257,600")
        ref.find_by_interval(itv).should ==
          "CAGGCGCCCGCATCCAGCTGGATNNNNNNNNNNNNNNNNNN"
      end
    end
  end

end

# N-Blocks
#  chr1:167281-217280,
#  chr1:257583-307582,
#  chr1:461232-511231,
#  chr1:2624081-2674080,
 
