class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params).valid?

    if @list
      @list = List.new(list_params)
      @list.save
      redirect_to list_path(@list)
    else
      @list = List.new(list_params)
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @list = List.find(params[:id])
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end
