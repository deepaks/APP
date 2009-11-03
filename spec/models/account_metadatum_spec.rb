require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe AccountMetadatum do
  
before(:each) do
   @account_metadatum = AccountMetadatum.new
  end

  it "should be valid" do
     @account_metadatum.should be_valid
  end

end
