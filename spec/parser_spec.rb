require 'json'
require 'parser'

describe Parser do

  describe '#read' do
    context 'when passed a json file path' do
      it 'opens the file and places them in a hash' do
        json_result = subject.read('test.json')
        expect(json_result["videos"].size).to eq 2
        expect(json_result["videos"][0]["title"]).to eq "Test Video"
      end
    end
  end

end
