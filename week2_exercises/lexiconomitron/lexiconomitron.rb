
class Lexiconomitron
	attr_accessor :str, :arr

	def eat_t(str)
		str.tr("tT","")
	end

  def shazam(arr)
    arr.map! do |word|
      word = eat_t(word)
      word.reverse
    end

    [arr[0],arr[arr.size - 1]]
  end

  def oompa_loompa(arr)
    arr.map! do |word|
      word = eat_t(word)
    end
    arr.select do |word|
      word.length < 4
    end

  end

end


#Rspec


describe Lexiconomitron do 

  before do
    @lexi = Lexiconomitron.new
  end

  describe "#eat_t" do
    it "removes every letter t from the input" do
      expect(@lexi.eat_t("great scott!")).to eq("grea sco!")
    end
  end

  describe "#shazam" do
    # it "takes an array of words, reverse every word" do
    #   expect(@lexi.shazam(["This", "is", "a", "boring", "test"])).to eq(["sihT", "si", "a", "gnirob", "tset"])
    # end

    # it "takes an array of words, reverse every word, removes the Ts" do
    #   expect(@lexi.shazam(["This", "is", "a", "boring", "test"])).to eq(["sih", "si", "a", "gnirob", "se"])
    # end

    it "takes an array of words, reverse every word, removes the Ts" do
      expect(@lexi.shazam(["This", "is", "a", "boring", "test"])).to eq(["sih", "se"])
    end

  end

  describe "#oompa_loompa" do
    it"should only accept three letter or less words of an array" do
      expect(@lexi.oompa_loompa(["if", "you", "wanna", "be", "my", "lover"])).to eq(["if", "you", "be", "my"])
    end

    it"should only accept three letter or less words of an array and eat the Ts" do
      expect(@lexi.oompa_loompa(["ask","me","do", "i", "want", "this", "i", "say", "do", "birds", "fly"])).to eq(["ask","me","do","i","wan","his","i","say","do","fly"])
    end
  end

end