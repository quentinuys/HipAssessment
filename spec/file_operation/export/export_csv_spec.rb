require_relative '../../spec_helper'

RSpec.describe 'FileOperation::Export::ExportCsv', "#Export" do 
    context "With Valid Export Object" do

        it "exports the object into an CSV file" do 
            exportop = FileOperation::Export::ExportCsv.new("spec/assets/test_good_output.csv", [['a','b','c'],[1,2,3]])

            expect(exportop.process).to eq([["a", "b", "c"], [1, 2, 3]])
            result_file = "spec/assets/test_good_output.csv"
            expect(result_file).not_to be_empty
        end
        
    end
    

end