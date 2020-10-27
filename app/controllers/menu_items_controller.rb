class MenuItemsController < ApplicationController
  # skip_before_action :verify_authenticity_token
  #protecing user data authenticty token, rails generates this specifically
  before_action :authenticate_user!
  before_action :check_roles
  before_action :set_item, only: [:show, :update, :edit, :destroy]
  #only want this set item method to run before these actions becuase theya re the only ones who need the instance variable
  def index
   @items = MenuItem.order(:tiem)
  end

  def show
    # @item = MenuItem.find(params[:id])
  end

  def create
    item = MenuItem.create(menu_item_params)#using method for specified params below in the private section
    #item = MenuItem.create(params) #rails forbids this by default as its a security issue so you have to explicilty tell it which attributes you want
    #MenuItem.create(tiem: params[:tiem], price: params[:price], quality: params[:quality])
    redirect_to menu_item_path(@item)
  end

  def new
    @item = MenuItem.new

  end

  def update
    # item = MenuItem.find(params[:id])
    @item.update(menu_item_params)
    redirect_to menu_item_path(@item)
  end

  def edit
    
    # @item = MenuItem.find(params[:id])
  end

  def destroy
    # item = MenuItem.find(params[:id])
    @item.destroy
    redirect_to menu_items_path
  end

  private

  def set_item
    @menus = Menu.all
    @item = MenuItem.find(params[:id])
  end

  def check_roles
    if (user_signed_in? && !current_user.has_role?(:admin))
      flash[:alert] = "You are not authorized to access that page"
      redirect_to root_path
    end
  end

  def menu_item_params
    params.require(:menu_item).permit(:tiem, :price, :quality, menu_ids: [])
  end


end
