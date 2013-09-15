require 'thor/group'

module Cpb
  module Generators
    class ClassGenerator < Thor::Group
      include Thor::Actions

      argument :name

      source_root File.expand_path("class_generator",File.dirname(__FILE__))
      def create_class
        create_file "lib/#{class_path(name)}.rb" do
          verbose_namespace_definition(name)
        end
      end

      def create_spec
        template "spec.rb.tt", "spec/#{class_path(name)}_spec.rb"
      end

      def create_spec_helper
        create_file "spec/spec_helper.rb" do
          "$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)"
        end
      end

      private
      def class_path(name)
        @class_path ||= if name =~ /[A-Z]/
          name.gsub(/::/, '/').
          gsub!(/(.)([A-Z])/,'\1_\2').
          downcase
        else
          name
        end
      end

      def described_class(name)
        @described_class ||= name.split(/[\/-]/).map do |frag|
          frag.split('_').map(&:capitalize).join("")
        end.join("::")
      end

      def verbose_namespace_definition(name)
        first_part, parts = described_class(name).split("::").reverse

        if parts
          parts = Array(parts)
          i = parts.length
          parts.inject(lambda { "#{tabs(parts.length)}class #{first_part}\n#{tabs(parts.length)}end\n" }) do |memo, namespace|
            lambda do
              "#{tabs(i-=1)}module #{namespace}\n" +
                memo.call +
              "#{tabs(i)}end\n"
            end
          end.call
        else
          "class #{first_part}\nend"
        end
      end

      def tabs(i)
        "  "*i
      end
    end
  end
end