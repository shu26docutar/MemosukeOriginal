class MemosController < ApplicationController
  def index
    @memo = Memo.new
    @memos = Memo.all
  end

  def create
    @memo = Memo.new(memo_params)
    if @memo.save
      redirect_to root_path(@memo)
    else
        render :index, alert: '保存できませんでした'
    end
  end

  def show
    @memo = Memo.find(params[:id])
  end

  def edit
    
  end
  

  def update
    
  end
  

  def destroy
    
  end
  

  private
  def memo_params
    params.require(:memo).permit(:title, :content)
  end
end
