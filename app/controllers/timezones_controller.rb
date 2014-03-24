class CatsController < ApplicationController
  before_action :set_cat, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  # GET /cats.json
  def index
    @cats = current_user.cats
    respond_to do |format|
      format.json do
        render :json =>  {cats: @cats}
      end
    end
  end
  
  # GET /cats/1.json
  def show
    respond_to do |format|
      format.json {
        render json: @cat
      }
    end
  end
  
  # POST /cats.json
  def create
    @cat = current_user.cats.build(cat_params)

    respond_to do |format|
      if @cat.save
        format.json { render json: {cat: @cat}, status: :created, location: @cat }
      else
        format.json { render json: @cat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH /cats/1.json
  def update
    respond_to do |format|
      if @cat.update(cat_params)
        format.json { head :no_content }
      else
        format.json { render json: @cat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cats/1.json
  def destroy
    @cat.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cat
      @cat = Cat.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def cat_params
      if  ["index", "destroy"].include?(params[:action]) 
        # Workaround when dealing with JSON:
        params.permit(:cat) 
      else
        params.require(:cat).permit(:name, :city, :offset)
      end
    end
end
