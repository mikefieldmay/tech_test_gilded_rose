require 'item'

describe Item do

  subject { described_class.new('Hat', 3, 5)}

  describe '::new' do

    it 'has a name' do
      expect(subject.name).to eq 'Hat'
    end

    it 'has a sell in value' do
      expect(subject.sell_in).to eq 3
    end

    it 'has a quality value' do
      expect(subject.quality).to eq 5
    end
  end

  describe 'to_s' do
    it 'returns information about the item in a string' do
      string = "Hat, 3, 5"
      expect(subject.to_s).to eq string

    end
  end

end
