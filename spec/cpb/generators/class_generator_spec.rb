require 'spec_helper'

require 'cpb/generators/class_generator'

describe Cpb::Generators::ClassGenerator do
  destination File.expand_path("../../../../tmp/class_artifacts",__FILE__)

  before { prepare_destination }

  it 'runs both the class and spec tasks' do
    gen = generator %w(posts)
    gen.should_receive :create_class
    gen.should_receive :create_spec
    capture(:stdout) { gen.invoke_all }
  end

  describe 'deep namespacing' do
    before do
      run_generator %w(many/namespaces/here)
    end

    describe 'the spec' do
      subject { file('lib/many/namespaces/here.rb') }

      it { should contain(/module Many/) }
    end
  end

  describe 'the generated files' do
    before do
      run_generator %w(posts)
    end

    describe 'the spec' do
      subject { file('spec/posts_spec.rb') }

      it { should exist }
      it { should contain(/require 'spec_helper'/) }
      it { should contain(/describe Posts/) }
    end

    describe 'the implementation' do
      subject { file('lib/posts.rb') }

      it { should exist }
      it { should contain(/class Posts/) }
    end
  end
end

