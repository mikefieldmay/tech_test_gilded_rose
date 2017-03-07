
require 'gilded_rose'
require 'item'
describe GildedRose do

  describe "#update_quality" do
    it 'the item quality is never negative' do
      item = Item.new("Hat", 4, 8)
      items = [item]
      gilded_rose = GildedRose.new(items)
      10.times { gilded_rose.update_quality}
      expect(item.quality).to eq 0
    end

    context 'when within the sale date' do
      it "degrades the quality of an item every day" do
        item = Item.new("Hat", 4, 8)
        items = [item]
        gilded_rose = GildedRose.new(items)
        gilded_rose.update_quality
        expect(item.quality).to eq 7
      end
    end

    context 'when the sale in date is 0' do
      it "quality degrades twice as fast" do
        item = Item.new("Hat", 0, 8)
        items = [item]
        gilded_rose = GildedRose.new(items)
        gilded_rose.update_quality()
        expect(item.quality).to eq 6
      end
    end

    context 'if the item is Aged Brie' do
      it 'increases in quality over time' do
        item = Item.new("Aged Brie", 4, 8)
        items = [item]
        gilded_rose = GildedRose.new(items)
        100.times { gilded_rose.update_quality}
        expect(item.quality).to eq 50
      end
    end

    context "Legendery items" do
      it 'never have to be sold or decrease in quality' do
        item = Item.new("Sulfuras, Hand of Ragnaros", 5, 8)
        items = [item]
        gilded_rose = GildedRose.new(items)
        100.times { gilded_rose.update_quality}
        expect(item.quality).to eq 8
        expect(item.sell_in).to eq 5
      end
    end

    context 'Backstage passes' do
      it 'increases in quality 2 times between 5 and 10 days' do
        item = Item.new("Backstage passes to a TAFKAL80ETC concert", 10, 8)
        items = [item]
        gilded_rose = GildedRose.new(items)
        gilded_rose.update_quality
        expect(item.quality).to eq 10
      end

      it 'increases in quality 3 times between 0 and 5 days' do
        item = Item.new("Backstage passes to a TAFKAL80ETC concert", 5, 8)
        items = [item]
        gilded_rose = GildedRose.new(items)
        gilded_rose.update_quality
        expect(item.quality).to eq 11
      end

      it 'increases in quality 3 times between 0 and 5 days' do
        item = Item.new("Backstage passes to a TAFKAL80ETC concert", 0, 8)
        items = [item]
        gilded_rose = GildedRose.new(items)
        gilded_rose.update_quality
        expect(item.quality).to eq 0
      end
    end
  end

end
