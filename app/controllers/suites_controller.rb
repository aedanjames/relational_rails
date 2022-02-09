class SuitesController < ApplicationController
  def index
    @suites = Suite.all
  end

  def show
    @suite = Suite.find(params[:id])
  end

  def edit
    @suite = Suite.find(params[:id])
  end

  def update
    suite = Suite.find(params[:id])
    suite.update(suite_params)
    redirect_to "/suites/#{suite.id}"
  end

  def destroy
    suite = Suite.find{params[:id]}
    suite.delete
    redirect_to "/suites"
end

private
  def suite_params
    params.permit(:name, :clean, :number_of_beds)
  end

end
