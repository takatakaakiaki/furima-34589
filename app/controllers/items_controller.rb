class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
  end

  def create
  end

  def new
  end

end
