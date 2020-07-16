require_relative '../lib/townhall.rb'

describe "the get_townhall_urls function" do
  it "return an array of all the URL of the townhalls pages" do
    expect(get_townhall_urls.class).to eq(Array) #On vérifie qu'on a bien un array à la sortie.
  end

  it "return an array of more than 100 values" do
    expect(get_townhall_urls.size > 100).to eq(true) #On vérifie qu'il y a plus de 100 valeurs dans le tableau
  end
end

describe "the convert_array function" do
  it "returns an array that can be exploited by get_townhall_email" do #On teste avec trois addresses au pif. Parce que pourquoi pas.
    expect(convert_array(["./95/bellefontaine.html", "./95/belloy-en-france.html", "./95/bernes-sur-oise.html"])).to eq(["http://annuaire-des-mairies.com/95/bellefontaine.html", "http://annuaire-des-mairies.com/95/belloy-en-france.html", "http://annuaire-des-mairies.com/95/bernes-sur-oise.html"])
  end
end

describe "the mairies_christmas function" do
  it " return an array of hashes that contain the name of a town and its e-mail address" do
    expect(mairies_christmas(["BELLEFONTAINE", "BELLOY-EN-FRANCE", "BERNES-SUR-OISE"], ["http://annuaire-des-mairies.com/95/bellefontaine.html", "http://annuaire-des-mairies.com/95/belloy-en-france.html", 
    "http://annuaire-des-mairies.com/95/bernes-sur-oise.html"])).to eq([{"BELLEFONTAINE" => "http://annuaire-des-mairies.com/95/bellefontaine.html"},{"BELLOY-EN-FRANCE" => "http://annuaire-des-mairies.com/95/belloy-en-france.html"}, {"BERNES-SUR-OISE" => "http://annuaire-des-mairies.com/95/bernes-sur-oise.html"}])

  end
end
