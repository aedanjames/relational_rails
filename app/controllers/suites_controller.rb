class SuitesController < ApplicationController
  def index
    @suites = Suite.all 
  end
end
