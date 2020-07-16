require_relative '../lib/dark_trader.rb'


describe "the crypto_scrapper function" do
  it "return an array" do
    expect(crypto_scrapper.class).to eq(Array) #je teste que j'ai bien un array en sortie de fonction
  end

  it "return an array of hash" do
    expect(crypto_scrapper[0].class).to eq(Hash) #Je teste que j'ai bien un hash en première position du tableau
  end
 

  it "return an array at least 200 values" do
    expect(crypto_scrapper.size > 100).to eq(true) # je teste que j'ai plus de 100 crypto dans mon hash
  end

end

  