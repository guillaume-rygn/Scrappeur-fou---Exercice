require 'rubocop'
require 'pry'
require 'rspec'

require 'nokogiri'
require 'open-uri'


def bienvenue
  url = "http://annuaire-des-mairies.com/val-d-oise.html"
  puts "Le programme suivant va scrapper les mairies et leur contact mail depuis le site : #{url}\n\n"
end

def init_noko
  page  = Nokogiri::HTML(URI.open("http://annuaire-des-mairies.com/val-d-oise.html"))
  return page
end

def get_townhall(page)
  townhall = page.xpath('//a[@class="lientxt"]')
  puts townhall
  return townhall
end

def townhall_name(townhall)
  townhall_name_array =[]

  townhall.each do |name|
    puts name.text
    townhall_name_array << name.text
  end

  puts "\n\nJ'ai ajouté #{townhall_name_array.length} mairies"
  return townhall_name_array
end


def townhall_url(townhall)
  url = townhall.map { |link| link['href'] }
  page_mail = Nokogiri::HTML(URI.open("http://annuaire-des-mairies.com/"))

  townhall_mail_array =[]

  url.each do |mail|
    url_full = "http://annuaire-des-mairies.com/"+(mail)
    page = Nokogiri::HTML(URI.open(url_full))
    
    mail = page.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').text
    
    puts mail
    townhall_mail_array << mail
  end
  
  puts "\n\nJ'ai ajouté #{townhall_mail_array.length} emails"
  return townhall_mail_array
end



def hash_townhall (townhall_name_array, townhall_mail_array)
  result = Hash.new
  i = 0
  puts "\n\n\n\n"
  while i <= townhall_name_array.length-1
    result[townhall_name_array[i]] = townhall_mail_array[i]
    i += 1
  end
  
  result = result.map {|name, mail| {name => mail}}
  puts "Voici le hash final :\n\n"
  puts result
  return result
end


def perform
  bienvenue
  page = init_noko
  townhall = get_townhall(page)
  townhall_name_array = townhall_name(townhall)
  townhall_mail_array = townhall_url(townhall)
  result = hash_townhall(townhall_name_array, townhall_mail_array)
end

perform