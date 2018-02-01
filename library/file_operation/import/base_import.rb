require_relative '../base_file_operation'
module FileOperation
    module Import
        class BaseImport < BaseFileOperation

            # This initialization is included for the child classes
            def initialize(file_name)
                @file_name = file_name
            end

            # This is a empty method that raises an error if it is not implemented in the child class.
            # Ruby way of Abstract class 
            def process
                raise NotImplemented, "A process method needs to be implemented for classes extending base import"
            end
        end
    end
end