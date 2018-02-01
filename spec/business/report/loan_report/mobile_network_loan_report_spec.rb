require_relative '../../../spec_helper'

RSpec.describe 'Business::LoanReport::MobileNetworkLoanReport', "#BusinessLoan" do 
    let(:valid_mobile_network_loan) { Business::LoanReport::MobileNetworkLoanReport.new('spec/assets/Loans.csv', 'spec/assets/Loans_out.csv') }
    let(:invalid_mobile_network_loan) { Business::LoanReport::MobileNetworkLoanReport.new('spec/assets/Loans_bad.csv', 'spec/assets/Loans_bad_out.csv') }
    
    context "With Valid Loan Object" do
        it "should not give an error when processsing report" do 
            expect(valid_mobile_network_loan.process_report).not_to eq(nil)
        end
    end

    context "With Invalid Loan Object" do
        it "should give an error when processsing report" do 
            expect { invalid_mobile_network_loan.process_report }.to raise_error(Business::Loan::LoanKeyValidationError)
        end
    end
end