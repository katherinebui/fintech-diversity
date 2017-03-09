require 'csv'

csv_text = File.read('companies.csv')
csv = CSV.parse(csv_text, headers: true)
csv.each do |row|
  p row.to_h
end
