
require 'dotenv'
# loads configuration from the .env file into the ENV hash
Dotenv.load
server = ENV['SERVER']
login = ENV['LOGIN']
password = ENV['PASSWORD']
auth = ENV['AUTH']

require 'net/ftp'
require 'net/http'
require 'net/https'
require 'uri'
require 'json'
require 'nori'


ftp = Net::FTP.new(server, login, password)

files = ftp.nlst('products.xml')

files.each do |file|
  xml_string = ftp.getbinaryfile(file, nil)
  parser = Nori.new(:convert_tags_to => lambda { |tag| tag.tr('_', ' ').tr('@', '') })
  products_hash = parser.parse(xml_string)
  products_hash['products']['product'].each do |product|
    body = product.to_json
    uri = URI('https://app.salsify.com/api/v1/products')
    headers = {
      'Authorization' => "Bearer #{auth}",
      'Content-Type' => 'application/json'
    }
    Net::HTTP.post(uri, body, headers)
  end
end
