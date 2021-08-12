class HomesController < ApplicationController
  def top
  end

  def new
    @list = Book.new
    @lists= Book.all
  end

  def create
    @list = Book.new(list_params)
    if @list.save
      flash[:notice] = "Book was successfully created."
    redirect_to book_path(@list.id)
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
    @list = Book.find(params[:id])
    if @list.update(list_params)
       flash[:notice] = "Book was successfully edited."
    redirect_to book_path(@list.id)
    else
    render :edit
    end
  end

  def destroy
    list = Book.find(params[:id])
   if list.destroy
     @list = Book.new
     @lists = Book.all
     flash[:notice] = "Book was successfully destroyed."
     render :new
   else
     render:new
   end
  end

   private
  def list_params
    params.require(:book).permit(:title, :body)
  end

end
