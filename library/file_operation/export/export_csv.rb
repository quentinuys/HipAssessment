require 'csv'
require_relative 'base_export'
module FileOperation
    module Export
        class ExportCsv < BaseExport
            
            # Initialize The export CSV class with a file_name to write to and a Array object for 
            # converting into CSV
            def initialize(file_name, export_object)
                super(file_name)
                @export_object = export_object
            end

            # Validates if this filetype is actually a csv file extension and calls write object to CSV
            def process
                validate_file_type(@file_name, 'csv')
                write_object_to_csv
            end

        private
        
        # Converts the array into an CSV file and writes it to disk
        def write_object_to_csv
                begin
                    CSV.open(@file_name, "wb") do |csv|
                        @export_object.each do |row|
                            csv << row
                        end
                    end                    
                rescue => exception
                    raise FileWriteError, exception
                end
            end
        end
    end
end