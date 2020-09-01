require 'nokogiri'
require 'httparty'

class CostcoScrapper
  def initialize(item)
    @item = item
  end

  def scrap
    sleep(5)
    url = "https://www.costco.ca/CatalogSearch?keyword=" + @item
    html_file = HTTParty.get(url)
    html_doc = Nokogiri::HTML(html_file.body)
    infos = []

    #puts html_doc

    html_doc.css('.product-list .product div .thumbnail').each do |element|
      photo_url = element.css('.product-img-holder div img').first.attribute('src').value
      price = element.css('.caption .caption div .price').first.text.strip
      url = element.css('.caption .caption .description a').first.attribute('href').value
      product_name = element.css('.caption .caption .description a').first.text.strip
      info = {photo: photo_url, description: "Not available", name: product_name, url: url, source: "costco", price: price}
      infos.push(info)
    end
    return infos
  end
end
