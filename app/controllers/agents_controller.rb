class AgentsController < ApplicationController
  def show
    @agent = Agent.find(params[:id])
    @promotions = @agent.promotions
  end
end