class PagesController < ApplicationController
  def index
    @sectors = Sector.all
  end
  def home
    @sectors = Sector.all
  end
  def about
  end
end
