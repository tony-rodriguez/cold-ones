require 'net/http'

get '/cold_one' do

  p ENV['BREWERYDB_API_KEY']
  uri = URI("http://api.brewerydb.com/v2/locations?locality=#{params[:city]}&key=#{ENV['BREWERYDB_API_KEY']}")

  request = Net::HTTP::Get.new(uri.request_uri)

  response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
      http.request(request)
   end

  results = JSON.parse(response.body)
  if results["totalResults"]
    p results.to_s
  else
    "No cold ones for you!"
  end

end
