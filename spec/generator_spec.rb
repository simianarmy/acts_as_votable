require 'spec_helper'
require File.join(File.dirname(__FILE__), '../generators/acts_as_votable/acts_as_votable_generator')

describe ActsAsVotableGenerator do
  describe "with no args" do
    before do
      @args = []
      @opts = {}
      ActsAsVotableGenerator.spec = Rails::Generator::Spec.new('acts_as_votable', 
        'generators/acts_as_votabe',
        'src')
    end
    
    it "should create generator without errors" do
      lambda {
        @generator = ActsAsVotableGenerator.new(@args, @opts)
      }.should_not raise_error
    end
    
    it "should create the migration" do
      @generator = ActsAsVotableGenerator.new(@args, @opts)
      Rails::Generator::Manifest.should_receive(:new).with(@generator).and_yield(@record=mock('Manifest'))
      @record.should_receive(:directory).with('db/migrate')
      @record.should_receive(:migration_template)
      @generator.manifest
    end
  end
end