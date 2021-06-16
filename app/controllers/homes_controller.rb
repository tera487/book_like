class HomesController < ApplicationController
  def index
    redirect_to :users_root if user_signed_in? 
  end
end
