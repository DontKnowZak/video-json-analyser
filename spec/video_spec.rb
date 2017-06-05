require 'video'

describe Video do

  describe "#calculate_like_dislike_percentage" do
    context "when given a data hash for a single video" do
      it "will return the like dislike percentage for that video" do
        v = Video.new('test', 1000, '3ihrNAaBZU8', "https://i.ytimg.com/vi/3ihrNAaBZU8/mqdefault.jpg", "2016-10-30T19:10:37.000Z", 10, 10)
        expect(v.calculate_like_dislike_percentage).to eq 50
      end
    end
  end

end
