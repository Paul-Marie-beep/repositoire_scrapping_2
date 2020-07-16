
require 'rubygems'
require 'nokogiri'
require 'open-uri'


def crypto_scrapper

  page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))   
  puts page.class   # => Nokogiri::HTML::Document

   
  #On fait un array avec uniquement les noms des crypto-monnaies
  crypto_name_array = []

  page.xpath('/html/body/div/div[1]/div[2]/div[1]/div[2]/div/div[2]/div[3]/div/table/tbody//td[3]/div').each do |node|
    crypto_name_array << node.text
  end


  #Maintenant on fait un array avec la valeur des cryptos
  crypto_value_array_dol = []

  page.xpath('/html/body/div/div[1]/div[2]/div[1]/div[2]/div/div[2]/div[3]/div/table/tbody/tr//td[@class="cmc-table__cell cmc-table__cell--sortable cmc-table__cell--right cmc-table__cell--sort-by__price"]/a[1]').each do |node|
    #puts node.text
    crypto_value_array_dol << node.text
  end


  #Maintenant, on va enlever le dollar des valeurs de l'array des valeurs
  crypto_value_array = []

  crypto_value_array_dol.each do |value|
  crypto_value_array << value.delete("$")
  end




  #Maintenant, on rassemble toutes ces valeurs dans un seul array de hash
  final_array = []

  for i in (0..crypto_value_array.size) do
    my_hash = {crypto_name_array[i] => crypto_value_array[i]}
    final_array << my_hash
  end

  return final_array
end


