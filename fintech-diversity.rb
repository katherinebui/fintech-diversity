require 'csv'
require 'pp'

# goal: fintech, london, tech teams < 15% female

def import_csv(csv_file)
  csv = CSV.read(csv_file, headers: true, header_converters: [:symbol, :downcase])
  @array_companies = csv.map{|row| row.to_h}
end

def format_data
  @array_companies.map do |company|
    company[:percent_female_eng] = company[:percent_female_eng].to_i
    company[:industry] = company[:industry].downcase
    company[:location] = company[:location].downcase
  end
end

def filter_data
  filter = []
  @array_companies.each do |company|
    if company[:location] == "london" && company[:industry] == "fintech" && company[:percent_female_eng] < 15
      filter << company
    end
  end
end

# pp filter
def result(csv_file)
  import_csv(csv_file)
  format_data
  filter_data
end

pp result('companies.csv')
