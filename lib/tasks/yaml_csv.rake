require 'csv'
seed_data = YAML.load_file('db/seeds.yml')

CSV_SEED_FILENAME = 'db/seed_to_csv.csv'

namespace :seed do
  desc "convert seeds to a flat file"
  task :to_csv do
    def flatten_hash(results, current_key, hash)
      hash.each do |new_key, value|
        combined_key = [current_key, new_key].delete_if { |k| k == '' }.join(".")
        if value.is_a?(Hash)
          flatten_hash(results, combined_key, value)
        else
          results[combined_key] = value
        end
      end
    end

    def flatten_array_of_hashes(array)
      array.map do |obj|
        results = {}
        flatten_hash(results, '', obj)
        results
      end
    end

    flattened_seeds = flatten_array_of_hashes(seed_data['movers'])

    headers = flattened_seeds.first.keys
    CSV.open(CSV_SEED_FILENAME, 'w') do |csv|
      csv << headers
      flattened_seeds.each do |mover|
        csv << mover.values
      end
    end
  end

  # Current this just prints the CSV in yaml format.
  # It should traverse dot paths(basically reverse the flattened file) and output to yaml

  desc "converts a CSV with dot paths into a yaml format we can seed."
  task :to_yaml do
    doc = CSV.read(CSV_SEED_FILENAME)
    fields = doc.shift
    records = []
    doc.each_with_index do |row, i|
      record = Hash.new
      fields.each_with_index do |field, j|
        record[field] = row[j]
      end
      records.push(record)
    end
    p records.to_yaml
  end
end
