class BoardsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    @board = Board.new(title: params[:title])
    @board.save
    redirect_to params[:redirect_path]
  end

  def show
    @user = User.find(params[:user_id])
    @board = Board.find_by(id: params[:id], user_id: @user.id)
  end
end
