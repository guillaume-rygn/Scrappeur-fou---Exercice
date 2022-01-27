require 'rubocop'
require 'pry'
require 'rspec'

require 'nokogiri'
require 'open-uri'

# Petit message de bienvenue
def bienvenue
  url = "https://coinmarketcap.com/all/views/all/"
  puts "Le programme suivant va scrapper le symbol et le prix de chaque cryptomonnaie du site : #{url}\n\n"
end

# Initialisation de la page Nokogiri
def init_noko
  page  = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/"))
  return page
end

# Main page 
def crypto_path(page)
  crypto_main_path = page.xpath('/html/body/div/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr')
  return crypto_main_path
end


def symbol_array(crypto_main_path)
  crypto_name_array = []
  i = 0

  crypto_main_path.each do |crypto_symbol|
    symbol = crypto_symbol.xpath('./td[3]/div').text
      
    if symbol != ""
      crypto_name_array << symbol
      i += 1
    else 
      i += 1
    end
  end

  puts "Je viens de récupérer #{crypto_name_array.length} symboles de cryptomonnaie différentes sur #{i} en tout, les voici : \n\n"

  puts crypto_name_array

  return crypto_name_array
end


def price_array(crypto_main_path)
  crypto_price_array = []
  i = 0

  crypto_main_path.each do |crypto_price|
    price = crypto_price.xpath('./td[5]/div/a').text
      
    if price != ""
      crypto_price_array << price
      i += 1
    else
      i += 1
    end
  end

  puts "\nJe viens de récupérer #{crypto_price_array.length} valeurs de cryptomonnaie différentes sur #{i} en tout, les voici : \n\n"

  puts crypto_price_array

  return crypto_price_array
end


def hash_crypto (crypto_name_array, crypto_price_array)
  result = Hash.new
  i = 0

  while i <= crypto_name_array.length-1
    result[crypto_name_array[i]] = crypto_price_array[i]
    i += 1
  end
  
  result = result.map {|symbol, prix| {symbol => prix}}

  return result
end


def display_hash_crypto (result)
  puts "\nVoici le hash final reprennant les cryptomonnaies associés à leur valeur respectivent : \n\n"
  puts result
end


def perform
  bienvenue
  page = init_noko
  crypto_main_path = crypto_path(page)
  crypto_name_array = symbol_array(crypto_main_path)
  crypto_price_array = price_array(crypto_main_path)
  result = hash_crypto(crypto_name_array, crypto_price_array)
  display_hash_crypto(result)
end

perform




