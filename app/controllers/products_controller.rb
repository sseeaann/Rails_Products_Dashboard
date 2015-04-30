class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
    @categories = Category.all
  end

  def edit
    @product = Product.find(params[:id])
    @categories = Category.all
  end

  def create
    @product = Product.new
    @product.name = params[:name]
    @product.description = params[:description]
    @product.pricing = params[:pricing]
    @product.category_id = params[:category]

    if @product.save
      redirect_to '/'
    else
      flash[:product_errors] = @product.errors.full_messages
      redirect_to '/products/new'
    end
  end

  def update
    Product.find(params[:id]).update(name:params[:name],description:params[:description],pricing:params[:pricing],category_id:params[:category])
    redirect_to '/'
  end

  def destroy
    @product = Product.find(params[:id]).destroy
    redirect_to '/'
  end


end
