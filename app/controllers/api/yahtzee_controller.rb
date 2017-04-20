class Api::YahtzeeController < ApplicationController
  def index
    render json: Score.all
  end

  def show
    render json: current_user.scores
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
