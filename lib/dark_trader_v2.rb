require 'rubocop'
require 'pry'
require 'rspec'

require 'nokogiri'
require 'open-uri'


def bienvenue
  url = "https://coinmarketcap.com/all/views/all/"
  puts "Le programme suivant va scrapper le symbol et le prix de chaque cryptomonnaie du site : #{url}\n\n"
end

def init_noko
  page  = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/"))
  return page
end



def crypto_path(page)
  crypto_main_path = page.xpath('//tr[@class="cmc-table-row"]/td[@class="cmc-table__cell cmc-table__cell--sticky cmc-table__cell--sortable cmc-table__cell--left cmc-table__cell--sort-by__name"]/div[@class="sc-1ibw5f9-0 bpOMHJ cmc-table__column-name cmc-table__column-name--narrow-layout"]/a[@class="cmc-table__column-name--symbol cmc-link"]|  
  //tr[@class="s395gx-1 eChPfw cmc-table-row"]/td[@class="name-cell"]/a[@class="cmc-link"]')

  return crypto_main_path

end


def crypto_url_symbol(crypto_main_path)
  url = crypto_main_path.map { |link| link['href'] }
  
  crypto_symbol =[]

  url.each do |link|
    url_full = "https://coinmarketcap.com"+(link)
    page = Nokogiri::HTML(URI.open(url_full))
                          
    symbol = page.xpath('/html/body/div[1]/div[1]/div[1]/div[2]/div/div[1]/div//h2/small[@class="nameSymbol"]').text
    
    if symbol != ""
      crypto_symbol << symbol
    end

    puts "J'ai récupéré la cryptomonnaie #{symbol}"
    
  end
  puts "j'ai récupéré #{crypto_symbol.length}"
  return crypto_symbol
  
end


def crypto_url_price(crypto_main_path)
  url = crypto_main_path.map { |link| link['href'] }
  
  crypto_price = []

  url.each do |link|
    url_full = "https://coinmarketcap.com"+(link)
    page = Nokogiri::HTML(URI.open(url_full))
                      
    price = page.xpath('/html/body/div/div[1]/div[1]/div[2]/div/div[1]/div[3]/div/div[2]/div[1]/div/span | /html/body/div/div[1]/div[1]/div[2]/div/div[1]/div[2]/div/div[2]/div[1]/div/span').text
    
    if price != ""
      crypto_price << price
    end

    puts "J'ai récupéré la valeur #{price}"
    
  end
  puts "j'ai récupéré #{crypto_price.length}"
  return crypto_price
  
end




def hash_crypto (crypto_symbol, crypto_price)
  result = Hash.new
  i = 0
  puts "\n\n\n\n"
  while i <= crypto_symbol.length-1
    result[crypto_symbol[i]] = crypto_price[i]
    i += 1
  end
  
  result = result.map {|symbol, price| {symbol => price}}
  puts result
  return result
end


def perform
  bienvenue
  page = init_noko
  crypto_main_path = crypto_path(page)
  crypto_symbol = crypto_url_symbol(crypto_main_path)
  crypto_price = crypto_url_price(crypto_main_path)
  result = hash_crypto(crypto_symbol, crypto_price)
end

perform
