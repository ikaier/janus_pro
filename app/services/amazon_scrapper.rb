require 'nokogiri'
require 'faraday'

class AmazonScrapper
  def initialize(item)
    @item = item
  end

  def scrap
    url = "https://www.amazon.com/s?k=" + @item
    html_file = Faraday.get url
    html_doc = Nokogiri::HTML(html_file.body)
    infos = []

    html_doc.css('.sg-row .sg-col-inner .sg-col-inner span div div div .sg-row div .sg-col-inner .a-section span a div img').each do |element|
      info = {}
      info = {photo: element.attribute('src').value, description: element.attribute('alt').value}
      infos.push(info)
    end

    counter = 0
    html_doc.css('.sg-row .sg-col-inner .sg-col-inner span div div div .sg-row div .sg-col-inner .sg-row div .sg-col-inner .a-section h2 a').each do |element|
      infos[counter][:url] = "www.amazon.com" + element.attribute('href').value
      infos[counter][:name] = element.text.strip
      counter = counter + 1
    end

    counter = 0
    html_doc.css('.sg-row .sg-col-inner .sg-col-inner span div div div .sg-row div .sg-col-inner .sg-row div .sg-col-inner .a-section .a-row .a-row a span .a-offscreen').each do |element|
      infos[counter][:price] = element.text.strip
      counter = counter + 1
    end

    counter = 0
    html_doc.css('.sg-row .sg-col-inner .sg-col-inner span div div div .sg-row div .sg-col-inner .sg-row div .sg-col-inner .a-section .a-row span span a i span').each do |element|
      infos[counter][:ratings] = element.text.strip
      counter = counter + 1
    end
    return infos
  end

end
