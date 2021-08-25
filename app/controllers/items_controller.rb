class ItemsController < ApplicationController
  def index
  end

  def create
    if user.save?
       sign_in(user)
       redirect_to root_path
    end
  end
end
