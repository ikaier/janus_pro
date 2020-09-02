require 'nokogiri'
require 'faraday'


class AmazonScrapper
  def initialize(item)
    @item = item
  end

  def scrap
    sleep(5)
    url = "https://www.amazon.com/s?k=" + @item
    html_file = Faraday.get url
    html_doc = Nokogiri::HTML(html_file.body)
    infos = []

    html_doc.css('.s-result-item .sg-col-inner span div div div div .sg-row div .sg-col-inner .a-section span a div img').each do |element|
      info = {}
      info = {photo: element.attribute('src').value, description: element.attribute('alt').value, source: "amazon"}
      infos.push(info)
    end

    counter = 0
    html_doc.css('.s-result-item .sg-col-inner span div div div div .sg-row div .sg-col-inner .sg-row div .sg-col-inner .a-section h2 a').each do |element|
      infos[counter][:url] = "https://www.amazon.com" + element.attribute('href').value
      infos[counter][:name] = element.text.strip
      counter = counter + 1
    end

    counter = 0

    html_doc.css('.s-result-item .sg-col-inner span div div div div .sg-row div .sg-col-inner .sg-row div .sg-col-inner .a-section .a-row .a-row a span .a-offscreen').each do |element|
      if counter > (infos.length - 1)
        next
      end
      infos[counter][:price] = element.text

      counter = counter + 1
    end

    counter = 0
    html_doc.css('.s-result-item .sg-col-inner span div div div div .sg-row div .sg-col-inner .sg-row div .sg-col-inner .a-section .a-row span span a i span').each do |element|
      infos[counter][:ratings] = element.text.strip
      counter = counter + 1
    end
    return infos
  end

  def scrape
    sleep(5)
    url = "https://www.amazon.com/s?k=" + @item
    html_file = Faraday.get url
    html_doc = Nokogiri::HTML(html_file.body)
    infos = []



    html_doc.css('.s-result-item .sg-col-inner span div .a-section .sg-row div .sg-col-inner .a-section span a div img').each do |element|
      info = {}
      info = {photo: element.attribute('src').value, description: element.attribute('alt').value, source: "amazon"}
      infos.push(info)
    end

    counter = 0
    html_doc.css('.s-result-item .sg-col-inner span div .a-section .sg-row div .sg-col-inner .sg-row div .sg-col-inner .a-section h2 a').each do |element|
      infos[counter][:url] = "https://www.amazon.com" + element.attribute('href').value
      infos[counter][:name] = element.text.strip
      counter = counter + 1
    end

    counter = 0
    html_doc.css('.s-result-item .sg-col-inner span div .a-section .sg-row div .sg-col-inner .sg-row div .sg-col-inner .a-section .a-row .a-row .a-text-normal').each do |element|
      if counter > (infos.length() - 1)
        next
      end
      infos[counter][:price] = element.css('.a-price .a-offscreen').first.text.strip
      counter = counter + 1
    end

    counter = 0
    html_doc.css('.s-result-item .sg-col-inner span div .a-section .sg-row div .sg-col-inner .sg-row div .sg-col-inner .a-section .a-row span span a i span').each do |element|
      infos[counter][:ratings] = element.text.strip
      counter = counter + 1
    end
    return infos.first(6)
  end

end
