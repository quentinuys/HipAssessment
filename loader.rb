require 'require_all'
require 'pry-byebug'
autoload_all File.dirname(__FILE__) + "/library"
Dir[File.join(".", "**/*.rb")].each do |f|
    require f if f[/spec/] == nil
end


