require "csv"
require_relative 'base_import'
module FileOperation
    module Import
        class ImportCsv < BaseImport
            
            # This Initilization for Import CSV takes a filename form the parent class initilization
            def initialize(file_name)
                super(file_name)
                @csv_object = []
            end

            # Validates if this filetype is actually a csv file extension and calls read CSV to object
            def process
                validate_file_type(@file_name, 'csv')
                convert_csv_file_to_object
            end

            # returns the CSV converted by to an Object
            def get_csv_object
                @csv_object
            end

        private

            # Converts a CSV file to an Object
            def convert_csv_file_to_object
                begin
                    CSV.foreach(@file_name) do |row|
                        @csv_object.push(row)
                    end                    
                rescue => exception
                    raise FileReadError, exception
                end
            end
        end
    end
end