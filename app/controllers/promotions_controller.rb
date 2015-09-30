class PromotionsController < ApplicationController

  def index
    @agent = Agent.all
    @promotions = Promotion.all
  end

  def search
    @search = params[:search]
    if params[:search].blank?
      flash[:danger] = "You cannot search for nothing."
      redirect_to root_path
    else
      @promotions = Promotion.search(@search)
    end
  end

end