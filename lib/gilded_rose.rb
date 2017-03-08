require_relative 'item'

class GildedRose

  MAX_QUALITY = 50
  MIN_QUALITY = 0
  SELL_BY_DATE = 0

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      if item.name != "Aged Brie" and item.name != "Backstage passes to a TAFKAL80ETC concert"
        if item.quality > MIN_QUALITY
          if item.name != "Sulfuras, Hand of Ragnaros"
            item.quality -= 1
          end
        end
      else
        if item.quality < MAX_QUALITY
          item.quality += 1
          if item.name == "Backstage passes to a TAFKAL80ETC concert"
            if item.sell_in < 11
              if item.quality < MAX_QUALITY
                item.quality += 1
              end
            end
            if item.sell_in < 6
              if item.quality < 50
                item.quality += 1
              end
            end
          end
        end
      end
      if item.name != "Sulfuras, Hand of Ragnaros"
        item.sell_in -= 1
      end
      if item.sell_in < SELL_BY_DATE
        if item.name != "Aged Brie"
          if item.name != "Backstage passes to a TAFKAL80ETC concert"
            if item.quality > MIN_QUALITY
              if item.name != "Sulfuras, Hand of Ragnaros"
                item.quality -= 1
              end
            end
          else
            item.quality -= item.quality
          end
        else
          if item.quality < MAX_QUALITY
            item.quality += 1
          end
        end
      end
    end


  end
end
