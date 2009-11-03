require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Accountdo
  before(:each) do
   @account = Account.new
  end

  it "should be valid" do
     @account.should be_valid
  end

end



