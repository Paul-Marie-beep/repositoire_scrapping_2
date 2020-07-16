require 'rubygems'
require 'nokogiri'
require 'open-uri'




def get_townhall_urls
page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))

  array_url = []

page.xpath('//a[@class="lientxt"]').each do |node|
   array_url <<  node['href']
  
  end
  
  return array_url
end  


def convert_array(array_url) #On va convertir les adresses internes au site en addresses valables pour Uri

  array_url_conv_1 = []

  array_url.each do |address|
    address[0] = ''
    array_url_conv_1 << "http://annuaire-des-mairies.com" + address
    
  end
  
  #print array_url_conv_1
  return array_url_conv_1
end





def get_townhall_email(array_url_conv_1) #cette fonction extrait l'addresse mail de la mairie à partir de son URL sur le site
  array_mail_address = []


array_url_conv_1.each do |address|


  page = Nokogiri::HTML(open(address))

  page.xpath('/html/body/div/main/section[2]/div/table/tbody//tr[@class="txt-primary tr-last"][4]/td[2]').each do |node|
  array_mail_address << node.text
  end
end

  return array_mail_address

end

#On va extraire le nom des villes
def get_town_names_urls
  page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))

    array_names = []

  page.xpath('//a[@class="lientxt"]').each do |node|
    array_names <<  node.text
    
    end
    return array_names
end  



def mairies_christmas(array_names, array_mail_address)
  final_array = []

  # Maintenant on crée un tableau de hash avec nos deux tableaux
  for i in (0..array_mail_address.size - 1)
    my_hash = {array_names[i] => array_mail_address[i]}
    final_array << my_hash
  end
  return final_array
end

  




  
  
  
  
  


