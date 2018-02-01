require_relative '../base_business'
module Business
    module Loan
        class LoanKeyValidationError < StandardError; end
        class BaseLoan < BaseBusiness
        end
    end
end