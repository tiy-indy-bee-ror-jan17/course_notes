class VisitorsController < ApplicationController

  def index
    # app/views/visitors/index.html.erb
    # render "app/views/visitors/index.html.erb"
  end

  def show
    @breeds = %w(Corgis Shepherd Spaniels Terrier Beagle)
  end

end
