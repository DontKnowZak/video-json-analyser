require 'analyser'

describe Analyser do

  json = ({
    "videos"=>[
      {
        "title"=>"Test Video",
        "views"=>401,
        "link"=>"dQw4w9WgXcQ", "thumbnail"=>"https://i.ytimg.com/vi/gTUi5iUqQ_I/mqdefault.jpg",
        "published_at"=>"2017-01-10T12:00:30.000Z",
        "likes"=>25,
        "dislikes"=>0
      },
      {
        "title"=>"Better Video",
        "views"=>93216,
        "link"=>"dQw4w9WgXcQ", "thumbnail"=>"https://i.ytimg.com/vi/3ihrNAaBZU8/mqdefault.jpg",
        "published_at"=>"2017-02-01T18:00:00.000Z",
        "likes"=>5000,
        "dislikes"=>30
      }
    ]
  })

  describe "#parse_json" do
    context "when provided a file path" do
      it "will receive the formatted json from a parser" do
        allow_any_instance_of(Parser).to receive(:read).with('test.json') { json }
        expect(subject.parse_json("test.json")["videos"].size).to eq 2
        expect(subject.parse_json("test.json")["videos"][0]["title"]).to eq "Test Video"
      end
    end
  end

  describe "#calculate_like_dislike_percentage" do
    context "when given a data hash for a single video" do
      it "will return the like dislike percentage for that video" do
        expect(subject.calculate_like_dislike_percentage(json["video"][0])).to eq 100
        expect(subject.calculate_like_dislike_percentage(json["video"][1])).to eq 99.4
      end
    end
  end
end
