class PromotionsController < ApplicationController

  def index
    @agent = Agent.all
    @promotions = Promotion.all
  end
end