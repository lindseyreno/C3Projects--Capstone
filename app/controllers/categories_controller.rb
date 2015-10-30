class CategoriesController < ApplicationController
  def show
    @schedules = Schedule.all
    @category = Category.find(params[:id])
    @categories = Category.all
  end
end
