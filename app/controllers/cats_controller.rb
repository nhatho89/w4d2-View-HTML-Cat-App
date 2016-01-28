class CatsController < ApplicationController
  skip_before_filter  :verify_authenticity_token

  def index
    @cats = Cat.all
      render :index
  end

  def show
    @cat = Cat.find_by(id: params[:id])
    if @cat
      render :show
    else
      redirect_to cats_url
    end
  end

  def new
    @cat = Cat.new
  end

  def create
    @cat = Cat.new(cat_params)
    if @cat.save
      redirect_to cats_url
    else
      render :new
    end
  end

  def update
    @cat = Cat.find_by(id: params[:id])
    if @cat.update_attributes(cat_params)
      redirect_to cats_url
    else
      render :edit
    end
  end

  def edit
    @cat = Cat.find_by(id: params[:id])
    render :edit
  end

  def destroy
    @cat = Cat.find_by(id: params[:id])
    @cat.destroy
    redirect_to cats_url
  end

  private
  def cat_params
    params.require(:cat).permit(:name, :description, :color, :birth_date, :sex)
  end
end
