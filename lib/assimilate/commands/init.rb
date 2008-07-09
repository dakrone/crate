module Assimilate::Commands
  class Init < ::Assimilate::Command

    attr_reader :directory
    attr_reader :project

    def initialize( opts = {} )
      @directory = opts['directory']
      @project   = opts['project']
    end

    def run_command
      Dir.chdir( directory ) do  |this_dir|
        project_dir = File.join( this_dir, project )
        puts "Making project directory #{project_dir}"

        recipe_dir = File.join( project_dir, "recipes" )
        FileUtils.mkdir_p( recipe_dir, :verbose => true )
        FileUtils.cp_r( Assimilate.data_path("recipes"), project_dir, :verbose => true )
        FileUtils.cp( Assimilate.data_path("Assimilate"), project_dir , :verbose => true ) unless File.exist?( File.join( project_dir, "Assimilate" ) )
      end
    end
  end
end
