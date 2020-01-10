class StoresController < ApplicationController
  before_action :set_store, only: [:show, :edit, :update, :destroy]

  # GET /stores
  # GET /stores.json
  def index
    authorize Store
    @filterrific = initialize_filterrific(
      Store,
      params[:filterrific],
      select_options: {
        with_status: Store.options_for_status
      },
      persistence_id: false,
      default_filter_params: {sorted_by: 'created_at_desc'},
      available_filters: [
        :sorted_by,
        :search,
      ],
    ) or return
    @stores = @filterrific.find.order(created_at: :desc).paginate(page: params[:page], per_page: 20)
  end

  # GET /stores/1
  # GET /stores/1.json
  def show
  end

  # GET /stores/new
  def new
    @store = Store.new
    @store_types = StoreType.all
  end

  # GET /stores/1/edit
  def edit
    @store_types = StoreType.all
  end

  # POST /stores
  # POST /stores.json
  def create
    @store = Store.new(store_params)

    respond_to do |format|
      if @store.save
        format.html { redirect_to @store, notice: 'La tienda se ha creado correctamente.' }
        format.json { render :show, status: :created, location: @store }
      else
        @store_types = StoreType.all
        format.html { render :new }
        format.json { render json: @store.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stores/1
  # PATCH/PUT /stores/1.json
  def update
    respond_to do |format|
      if @store.update(store_params)
        format.html { redirect_to @store, notice: 'La tienda se ha modificado correctamente.' }
        format.json { render :show, status: :ok, location: @store }
      else
        @store_types = StoreType.all
        format.html { render :edit }
        format.json { render json: @store.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stores/1
  # DELETE /stores/1.json
  def destroy
    @store.destroy
    respond_to do |format|
      format.html { redirect_to stores_url, notice: 'La tienda se ha eliminado correctamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_store
      @store = Store.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def store_params
      params.require(:store).permit(:name, :cuit, :address, :description, :store_type_id)
    end
end
