class StatusesController < ApplicationController
  before_action :set_status, only: %i[ show update destroy ]

  # GET /status
  def index
    @q = Status.ransack(params[:q])
    @pagy, @status = pagy(@q.result)

    render json: { status: @status, pagy: @pagy }
  end

  # GET /status/1
  def show
    render json: @status
  end

  # POST /status
  def create
    @status = Status.new(status_params)

    if @status.save
      render json: @status, status: :created, location: @status
    else
      render json: @status.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /status/1
  def update
    if @status.update(status_params)
      render json: @status
    else
      render json: @status.errors, status: :unprocessable_entity
    end
  end

  # DELETE /status/1
  def destroy
    @status.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_status
      @status = Status.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def status_params
      params.expect(status: [ :descricao ])
    end
end
