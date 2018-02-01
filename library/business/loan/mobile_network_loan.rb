module Business
    module Loan
        class MobileNetworkLoan < BaseLoan
            # Generates a Loan Key based on keys used for mobile network
            # * Network
            # * Product
            # * Month
            def loan_key(loan_record)
                key = "#{loan_record["Network"]} #{loan_record["Product"]} #{DateTime.parse(loan_record["Date"].gsub('\'','')).strftime("%B") }"
                key.downcase.strip.gsub(' ', '_').gsub(/[^\w-]/, '')
            end

            # Validates a loan key for mobile network
            def valid_loan_key(loan_record)
                valid = loan_key(loan_record)[/[network]{7}[_][\d]+[_][\w].*[[_][\w].*]$/] != nil
                unless valid
                    raise Business::Loan::LoanKeyValidationError, "Could not validate loan key: #{loan_key(loan_record)}" 
                end
                loan_key(loan_record)
            end
        end
    end
end