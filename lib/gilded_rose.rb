require_relative 'item'

class GildedRose

  MAX_QUALITY = 50
  MIN_QUALITY = 0
  SELL_BY_DATE = 0
  CONCERT_APPROACHING = 10
  CONCERT_IMMINENT = 5

  def initialize(items)
    @items = items
    @special_items = ["Aged Brie", "Backstage passes to a TAFKAL80ETC concert", "Sulfuras, Hand of Ragnaros"]
  end

  def update_quality()
    @items.each do |item|
      #  Sulfuras
      if item.name == "Sulfuras, Hand of Ragnaros"
        # Aged Brie
      elsif item.name == "Aged Brie"
        aged_brie(item)
        # backstage pass
      elsif item.name == "Backstage passes to a TAFKAL80ETC concert"
        if item.sell_in < SELL_BY_DATE
          item.quality = 0
          item.sell_in -= 1
        elsif item.quality < MAX_QUALITY && item.sell_in <= CONCERT_IMMINENT
          item.quality += 3
          item.sell_in -= 1
        elsif item.quality < MAX_QUALITY && item.sell_in <= CONCERT_APPROACHING
          item.quality += 2
          item.sell_in -= 1
        elsif item.quality < MAX_QUALITY && item.sell_in >= CONCERT_APPROACHING
          item.quality += 1
          item.sell_in -= 1
        elsif item.sell_in < SELL_BY_DATE
          item.sell_in = 0
        end
      else
        if item.quality > MIN_QUALITY && item.sell_in > SELL_BY_DATE
          item.quality -= 1
          item.sell_in -= 1
        elsif item.quality > MIN_QUALITY && item.sell_in <= SELL_BY_DATE
          item.quality -= 2
          item.sell_in -= 1
        else
          item.quality = 0
        end
      end
    end
  end

  private

  def special_item?(item)
    special_items.include?(item)
  end

  def aged_brie(item)
    if item.quality < MAX_QUALITY
      item.quality += 1
      item.sell_in -= 1
    else
      item.sell_in -= 1
    end
  end

end
