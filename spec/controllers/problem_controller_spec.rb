require 'spec_helper'

describe ProblemController do

  describe "GET 'Allproduct'" do
    it "returns http success" do
      get 'Allproduct'
      response.should be_success
    end
  end

end
