module FileOperation
    class FileReadError < StandardError; end
    class FileWriteError < StandardError; end
    class FileTypeError < StandardError; end
    class NotImplemented < StandardError; end

    class BaseFileOperation
        
        # Validates if a file has the right extension 
        def validate_file_type(filename, filetype)
            raise FileTypeError unless filename[filetype]
        end
    end
end
    