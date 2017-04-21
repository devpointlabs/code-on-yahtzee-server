class Api::YahtzeeController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @scores = Score.all.order(value: :desc)
    render :scores
  end

  def show
    @scores = current_user.scores.order(value: :desc)
    render :scores
  end
  
  def create
    score = current_user.scores.new(score_params)
    if score.save
      render json: score
    else
      render json: { errors: score.errors.join(',') }, status: :unprocessable
    end
  end

  private
    def score_params
      params.require(:score).permit(:value)
    end
end
