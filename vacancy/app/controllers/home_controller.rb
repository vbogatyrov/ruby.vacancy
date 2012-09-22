class HomeController < ApplicationController
  def index
    @men = Man.all
  end
end
