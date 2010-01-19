module Dragonfly
  module Analysis
    
    class FileCommandAnalyser < Base
      
      include Configurable
      
      configurable_attr :file_command do `which file`.chomp end
      
      def mime_type(temp_object)
        IO.popen("#{file_command} -b --mime-type -", mode='r+') do |io|        
          io.write_nonblock temp_object.data
          io.close_write
          io.read         
        end
      end
      
    end
    
  end
end
