require 'hashie'

module Test
  Config = Hashie::Mash.new
  class << Config
    def from_file(file)
      # default
      config = Hashie::Mash.new
      config.git = {
        :end_point => 'hoge',
        :taken => 'hoge',
      }

      # overwirte
      self.instance_eval(File.read(file))
      config.each do |key, value|
        self.custom_writer(key,value)
      end
    end
  end

  Config.from_file(File.expand_path('config/config.rb'))
end
