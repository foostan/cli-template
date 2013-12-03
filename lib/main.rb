require 'config'

module Test
  class Main
    def run
      puts Config.git.end_point
      puts Config.git.taken
    end
  end
end
