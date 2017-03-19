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
    items.each do |item|
      if special_item?(item)
        special_method(item)
      else
        normal_item(item)
      end
    end
  end

  private

  attr_reader :special_items, :items

  def special_item?(item)
    special_items.include?(item.name)
  end

  def special_method(item)
    item
    aged_brie(item) if item.name == "Aged Brie"
    backstage_pass(item) if item.name == "Backstage passes to a TAFKAL80ETC concert"
  end

  def aged_brie(item)
    if item.quality < MAX_QUALITY
      item.quality += 1
      item.sell_in -= 1
    else
      item.sell_in -= 1
    end
  end

  def backstage_pass(item)
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
  end

  def normal_item(item)
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
