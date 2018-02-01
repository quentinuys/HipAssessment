require_relative '../../spec_helper'

RSpec.describe 'FileOperation::Import::ImportCsv', "#Import" do 
    context "With Valid Import File" do

        let(:expected_result) { [["MSISDN", "Network", "Date", "Product", "Amount"], ["27729554427", "'Network 1'", "'12-Mar-2016'", "'...n Product 2'", "1801"], ["27729554427", "'Network 1'", "'16-Apr-2016'", "'Loan Product 2'", "1801"]] }

        it "imports the CSV file into an object" do
 
            importop = FileOperation::Import::ImportCsv.new("spec/assets/Loans.csv")

            expect(importop.process).to eq(nil)
            expect(importop.get_csv_object.first).to match_array(expected_result.first)
            expect(importop.get_csv_object.last).to match_array(expected_result.last)
        end     
    end

    context "With Invalid Import File" do

        let(:import_file_bad_name){FileOperation::Import::ImportCsv.new("spec/assets/Loans_bad.cv")}

        it "failes when converting it into an object" do
            expect { import_file_bad_name.process}.to raise_error(FileOperation::FileTypeError)
        end
    end
end