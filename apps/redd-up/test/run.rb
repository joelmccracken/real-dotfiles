require 'minitest/autorun'
require_relative '../lib/redd_up'

def run_it
  ReddUp::Runner.new.run ["check"]
end

# functional tests
describe "something" do
  it "works" do
    run_it
  end
end
