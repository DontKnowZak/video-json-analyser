require 'analyser'

describe Analyser do

  json = ({
    "videos"=>[
      {
        "title"=>"Test Video",
        "views"=>401,
        "link"=>"dQw4w9WgXcQ", "thumbnail"=>"https://i.ytimg.com/vi/gTUi5iUqQ_I/mqdefault.jpg",
        "published_at"=>"2017-02-01T12:00:00.000Z",
        "likes"=>25,
        "dislikes"=>0
      },
      {
        "title"=>"Better Video",
        "views"=>93216,
        "link"=>"dQw4w9WgXcQ", "thumbnail"=>"https://i.ytimg.com/vi/3ihrNAaBZU8/mqdefault.jpg",
        "published_at"=>"2017-01-01T12:00:00.000Z",
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

    context "when not provided a file path" do
      it "will throw error" do
        expect{subject.parse_json}.to raise_error(RuntimeError)
      end
    end
  end

  describe "#calculate_like_dislike_percentage" do
    context "when given a data hash for a single video" do
      it "will return the like dislike percentage for that video" do
        expect(subject.calculate_like_dislike_percentage(json["videos"][0])).to eq 100
        expect(subject.calculate_like_dislike_percentage(json["videos"][1])).to eq 99.4
      end
    end
  end

  describe "#highest_like_dislike_percentage" do
    context "when given an array of data hashes for videos" do
      it "will return the highest like dislike percentage and the title" do
        expect(subject.highest_like_dislike_percentage(json["videos"])).to eq [100, "Test Video"]
      end
    end
  end

  describe "#average_like_dislike_percentage" do
    context "when given an array of data hashes for videos" do
      it "will return the average like dislike percentage for the array" do
        expect(subject.average_like_dislike_percentage(json["videos"])).to eq 99.7
      end
    end
  end

  describe "#total_views" do
    context "when given an array of data hashes for videos" do
      it "will return the total view count of videos in the array" do
        expect(subject.total_views(json["videos"])).to eq 93617
      end
    end
  end

  describe "#average_time_between_videos" do
    context "when given an array of data hashes for videos" do
      it "will return the average time between videos" do
        expect(subject.average_time_between_videos(json["videos"])).to eq [31, 0, 0, 0]
      end
    end
  end
end
