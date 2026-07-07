# frozen_string_literal: true
# Jekyll 3.9 calls CSV.read(path, hash) but csv-3.3+ requires keyword args.
# This patch restores compatibility on Ruby 4.0 / csv 3.3.x.
require "csv"
module Jekyll
  class DataReader
    def read_data_file(path)
      case File.extname(path).downcase
      when ".csv"
        CSV.read(path, **{
          :headers  => true,
          :encoding => site.config["encoding"],
        }).map(&:to_hash)
      when ".tsv"
        CSV.read(path, **{
          :col_sep  => "\t",
          :headers  => true,
          :encoding => site.config["encoding"],
        }).map(&:to_hash)
      else
        SafeYAML.load_file(path)
      end
    end
  end
end
