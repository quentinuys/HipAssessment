require_relative '../../spec_helper'

RSpec.describe 'Business::Loan::MobileNetworkLoan', "#Business" do
    
    let(:mobile_network) { Business::Loan::MobileNetworkLoan.new }
    
    context "With Valid Loan Object" do

        let(:valid_loan_parameters) {{"Network" => "Network 1", "Product" => "Product 1", "Date" => "03 Jan 2018"}}

        it "creates a loan key based on values given" do 
            expect(mobile_network.loan_key(valid_loan_parameters)).to eq("network_1_product_1_january")
        end

        it "should validate the mobile network loan key" do 
            expect(mobile_network.valid_loan_key(valid_loan_parameters)).to eq("network_1_product_1_january")
        end
    end

    context "With Valid Loan Object" do

        let(:invalid_loan_parameters) {{"Network" => "Netork 1", "Product" => "Product 1", "Date" => "03 Jan 2018"}}

        it "creates a loan key based on values given" do 
            expect(mobile_network.loan_key(invalid_loan_parameters)).to eq("netork_1_product_1_january")
        end

        it "should raise error when validating the mobile network loan key" do 
            expect { mobile_network.valid_loan_key(invalid_loan_parameters) }.to raise_error(Business::Loan::LoanKeyValidationError)
        end
    end
end