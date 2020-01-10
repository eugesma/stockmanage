class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :update, :destroy, :delete]

  # GET /clients
  # GET /clients.json
  def index
    authorize Client
    @filterrific = initialize_filterrific(
      Client,
      params[:filterrific],
      persistence_id: false,
      default_filter_params: {sorted_by: 'created_at_desc'},
      available_filters: [
        :sorted_by,
        :search,
      ],
    ) or return
    @clients = @filterrific.find.order(created_at: :desc).paginate(page: params[:page], per_page: 16)
  end

  # GET /clients/1
  # GET /clients/1.json
  def show
  end

  # GET /clients/new
  def new
    @client = Client.new
  end

  # GET /clients/1/edit
  def edit
  end

  # POST /clients
  # POST /clients.json
  def create
    @client = Client.new(client_params)

    respond_to do |format|
      if @client.save
        format.html { redirect_to @client, notice: 'El cliente se ha creado correctamente.' }
        format.json { render :show, status: :created, location: @client }
      else
        format.html { render :new }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clients/1
  # PATCH/PUT /clients/1.json
  def update
    respond_to do |format|
      if @client.update(client_params)
        format.html { redirect_to @client, notice: 'El cliente se ha modificado correctamente.' }
        format.json { render :show, status: :ok, location: @client }
      else
        format.html { render :edit }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clients/1
  # DELETE /clients/1.json
  def destroy
    @client.destroy
    respond_to do |format|
      format.html { redirect_to clients_url, notice: 'El cliente se ha eliminado correctamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client
      @client = Client.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def client_params
      params.require(:client).permit(:fullname, :dni, :cuit, :phone, :email)
    end
end
