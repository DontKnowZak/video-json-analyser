require 'analyser'

describe Analyser do

  describe "#parse_json" do
    context "when provided a file path" do
      it "will receive the formatted json from a parser" do
        expect(subject.parse_json("test.json")["videos"].size).to eq 2
        expect(subject.parse_json("test.json")["videos"][0]["title"]).to eq "Test Video"
      end
    end
  end
end
