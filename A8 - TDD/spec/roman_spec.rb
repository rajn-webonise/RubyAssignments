require "roman"


describe Roman do
  describe "#hi" do
    it "gives back hi" do
    expect(Roman.hi).to eq("HI")
    end

  end

  describe "#parse valid roman values" do
    it "checks when input is adding up decimals upto 3 times" do
      expect(Roman.parse("C C V I I I")).to eq(208)
    end

    it "checks when input is having decimal before a bigger numeral" do
      expect(Roman.parse("X C I I")).to eq(92)
    end

  end
  
  describe "#parse invalid roman values: " do
    it "checks when input is adding up decimals more than three times" do
      expect(Roman.parse("C C V I I I I")).to eq("Numeral 'I' has repeated more than thrice!")
    end

    it "checks when input is adding up non-decimals more than once" do
      expect(Roman.parse("C V V I I")).to eq("Non-decimal numeral 'V', not allowed to be repeated!")
    end

    it "checks when input is having non-decimal before a bigger numeral" do
      expect(Roman.parse("C V V X I I")).to eq("Can't subtract non-decimal numeral 'V'")
    end

    it "checks when input is having greater numeral before a numeral" do
      expect(Roman.parse("X I X C")).to eq("Current numeral 'C' can't be greater than the previous one")
    end

  end

  describe "Sanity checks" do

    it "X C I I should be 92" do
      expect(Roman.parse("X C I I")).to eq(92)
    end

    it "C C X C should be 290" do
      expect(Roman.parse("C C X C")).to eq(290)
    end

    it "M D C C L X X X I I should be 1782" do
      expect(Roman.parse("M D C C L X X X I I")).to eq(1782)
    end

    it "X I X C should be invalid" do
      expect(Roman.parse("X I X C")).to eq("Current numeral 'C' can't be greater than the previous one")
    end

    it "X I X X should be invalid" do
      expect(Roman.parse("X I X X")).to eq("Current numeral 'X' can't be greater than the previous one")
    end

    it "X C C should be invalid" do
      expect(Roman.parse("X C C")).to eq("Current numeral 'C' can't be greater than the previous one")
    end

  end


end
