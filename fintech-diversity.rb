require 'csv'
require 'pp'

# goal: fintech, london, tech teams < 15% female
csv = CSV.read('companies.csv', headers: true, header_converters: [:symbol, :downcase])
array_companies = csv.map{|row| row.to_h}

array_companies.map do |company|
  company[:percent_female_eng] = company[:percent_female_eng].to_i
  company[:industry] = company[:industry].downcase
  company[:location] = company[:location].downcase
end

# p array_companies

filter = []
array_companies.each do |company|
  if company[:location] == "london" && company[:industry] == "fintech" && company[:percent_female_eng] < 15
    filter << company
  end
end

pp filter
