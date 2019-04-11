class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.all
  end

  def show
    @item_photos = @item.item_photos.all
  end

  def new
    @item = Item.new
    @item_photo = @item.item_photos.build
  end

  def edit
  end

  def create
    @item = Item.new(item_params)

    respond_to do |format|
      if @item.save
        params[:item_photos]['photo'].each do |a|
          @item_photo = @item.item_photos.create!(:photo => a)
        end
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @item.update(item_params)
        params[:item_photos]['photo'].each do |a|
          @item_photo = @item.item_photos.create!(:photo => a)
        end
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
    end
  end

  private
  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, item_photos_attributes: [:id, :item_id, :photo])
  end
end