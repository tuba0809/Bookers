class HomesController < ApplicationController
  def new
    @list = Book.new
    @lists= Book.all
  end

  def create
    @list = Book.new(list_params)
    if @list.save
    redirect_to home_path(@list.id)
    else
      @lists = Book.all
    render :new
    end
  end

  def show
    @list = Book.find(params[:id])
  end

  def edit
    @list = Book.find(params[:id])
  end

  def update
    list = Book.find(params[:id])
    list.update(list_params)
    redirect_to home_path(list.id)
  end

   private
  def list_params
    params.require(:book).permit(:title, :body)
  end

end
