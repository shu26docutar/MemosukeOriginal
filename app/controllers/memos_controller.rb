class MemosController < ApplicationController
  before_action :set_memo, only: [:show, :destroy]

  def index
    @memo = Memo.new
    @memos = Memo.all
  end

  def create
    @memo = Memo.new(memo_params)
    if @memo.save
      redirect_to root_path
    else
        render :index, alert: '保存できませんでした'
    end
  end

  def show
  end

  def edit
    
  end
  

  def update
    
  end
  

  def destroy
    @memo.destroy
    redirect_to root_path(@memo)
  end
  

  private
  def memo_params
    params.require(:memo).permit(:title, :content).merge(user_id: current_user.id)
  end

  def set_memo
    @memo = Memo.find(params[:id])
  end
end
