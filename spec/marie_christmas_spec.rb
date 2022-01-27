require_relative '../lib/marie_christmas.rb'

describe "if the path is not empty" do
  it "should return =!nil" do
    expect(get_townhall(Nokogiri::HTML(URI.open("http://annuaire-des-mairies.com/val-d-oise.html")))).not_to be_nil
  end
end