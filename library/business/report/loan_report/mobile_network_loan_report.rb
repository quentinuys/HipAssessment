require_relative 'base_loan_report'

module Business
    module LoanReport
        class MobileNetworkLoanReport < BaseLoanReport
            
            # Initializes a new Mobile Network Loan report with the filename the report will be done with
            def initialize(file_name, export_file='./Output.csv')
                @file_name = file_name
                @export_file = export_file
                @report_summary = {}
            end

            # Constructs the report including validation and Writes it to a csv file
            def process_report
                construct_report
                write_csv_report
            end

        private

            def construct_report

                mobile_loan = Business::Loan::MobileNetworkLoan.new
                reports = {}

                report_content.each do |row|

                    next if row == csv_header

                    named_row = Hash[csv_header.zip(row)]
                    loan_key = mobile_loan.valid_loan_key(named_row)
                    loan_key = loan_key.tr("\"", "")

                    unless reports.include? loan_key 
                        
                        reports[loan_key] = row
                        reports[loan_key].unshift(loan_key)
                        reports[loan_key].delete_at 5
                        reports[loan_key].push 1
                        reports[loan_key].push named_row["Amount"].to_f
                        
                    else
                        reports[loan_key][5] +=  1
                        reports[loan_key][6] = reports[loan_key][6].to_f + named_row["Amount"].to_f
                    end

                end
                @report_summary = reports.values.unshift(*[csv_output_header]) 
            end

            def loan_key(named_row)

                Business::Loan::MobileNetworkLoan.new.tap do |mobile_loan|
                    mobile_loan.valid_loan_key(named_row)
                end
            end
            
            def report_content

                FileOperation::Import::ImportCsv.new(@file_name).tap do |import|
                    import.process
                end.get_csv_object
            end

            def write_csv_report

                FileOperation::Export::ExportCsv.new(@export_file, @report_summary).tap do |export|
                    export.process
                end
            end

            def csv_header
                %w{MSISDN Network Date Product Amount}
            end
            
            def csv_output_header
                %w{Loan_Key MSISDN Network Date Product Count Total}
            end
        end
    end
end