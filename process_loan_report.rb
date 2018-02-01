require_relative 'loader'

report_path = ARGV[0]
report_path ||= 'spec/assets/Loans.csv'

output_path ||= ARGV[1]

mobile_network_report = Business::LoanReport::MobileNetworkLoanReport.new(report_path, output_path)
mobile_network_report.process_report
