require 'parser'

describe Parser do

  describe '#read' do
    context 'when passed a json file path' do
      it 'opens the file and places them in a hash' do
        videos = subject.read('test.json')
        expect(videos.size).to eq 2
        expect(videos[0].title).to eq "Test Video"
      end
    end
  end

end
