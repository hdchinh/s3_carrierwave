class ItemPhotosController < ApplicationController
  def destroy
    @item_photo = ItemPhoto.find(params[:id])
    item = @item_photo.item
    @item_photo.destroy
    respond_to do |format|
      format.html {redirect_to item_url(item), notice: 'Item photo was successfully destroyed.'}
    end
  end
end
