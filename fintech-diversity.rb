require 'csv'

# goal: fintech, london, tech teams < 15% female
csv = CSV.read('companies.csv', headers: true, header_converters: [:symbol, :downcase])
array_companies = csv.map{|row| row.to_h}

array_companies.map do |company|
  company.map do |header, info|
    company[header] = info.downcase
  end
end

filter = []
array_companies.each do |row|
  if row[:location] == "london" && row[:industry] == "fintech"
    filter << row
  end
end


p filter
p filter.length
