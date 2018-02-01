Project:
    This is an Report generating system.
    The project is written in Ruby with only 3 gems added.
    It is build to be able to incorporate more reports as needed. 
    It current have the MobileNetwork business to give loan reports for.
    The File Operations is seperate so it can be used to export CSV files from any class that requires it.
    It is also easily adaptable for more file types.
    I added a test suit for testing the public methods. I can add more test cases as business requirements specifies.

Usage:
    From the console, Navigate to directory and run th following.
    
    $: bundle //Prepares all the gems added in the Gemfile
    $: rspec //To run the test cases on the project
    $: ruby process_loan_report #//Builds the report with "spec/assets/Loans.csv" CSV file and writes it to Output.csv
    
    Optionally
    $: ruby process_loan_report "Path/to/csv/file.csv" would use that file for the report and
    $: ruby process_loan_report "Path/to/csv/file.csv" "Path/to/Outputfile.csv" would use the last file as output

Assumptions:

    There was no mention of how the internal system keys are stored. I assume it would be in a database. 
    I did not include a database in the assesment to make it run without a database connection. The method that does the 
    validation could be easily changed to accomodate the change
    
Language Choice:
    This project could have been written in any language but I have chosen Ruby because it uses 
    less code to accomplish a task. I also wanted to show I have some ruby experience for the Job.