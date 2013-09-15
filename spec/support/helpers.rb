module Helpers

  module ClassMethods
    def destination(new_destination)
      let(:destination_root) { new_destination }
    end
  end

  module InstanceMethods
    def capture(stream,&block)
      capturing = StringIO.new

      case stream
      when :stdout
        $stdout = capturing
      end

      yield
      capturing
    ensure
      $stdout = STDOUT
    end

    def prepare_destination
      FileUtils.rm_rf destination_root
      FileUtils.mkdir_p destination_root
    end

    def generator(arguments, options={}, config={})
      @generator ||= described_class.new(arguments, options, {destination_root: destination_root}.merge(config))
    end

    def run_generator(arguments, options={}, config={})
      capture(:stdout) {
        generator(arguments,options,config).invoke_all
      }
    end

    def file(relative)
      File.expand_path(relative, destination_root)
    end
  end
end
