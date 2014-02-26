class HomeController < ApplicationController
  require_role [:operador, :admin]

  def index

  end
  
end
