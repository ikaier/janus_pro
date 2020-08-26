require 'nokogiri'
require 'faraday'

class EbayScrapper
  def initialize(item)
    @item = item
  end

  def scrap
    sleep(1)
    url = "https://www.ebay.ca/sch/i.html?_nkw=" + @item
    html_file = Faraday.get url
    html_doc = Nokogiri::HTML(html_file.body)

    infos = []

    html_doc.css('.s-item__info a').each do |element|
      info = {}
      info = {url: element.attribute('href').value, name: element.text.strip, ratings: "Not available"}
      infos.push(info)
    end

    counter = 0
    html_doc.css('.s-item__image-img').each do |element|
      infos[counter][:photo] = element.attribute('src').value
      counter = counter + 1
    end

    counter = 0
    html_doc.css('.s-item__price').each do |element|
      infos[counter][:price] = element.text.strip
      counter = counter + 1
    end
    return infos.first(10)
  end

end
