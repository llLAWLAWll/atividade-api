class HistoriaController < ApplicationController
  before_action :set_historia, only: %i[ show update destroy ]

  # GET /historia
  def index
    @q = Historia.ransack(params[:q])
    @pagy, @historia = pagy(@q.result)

    render json: { historia: @historia, pagy: @pagy }
  end

  # GET /historia/1
  def show
    render json: @historia
  end

  # POST /historia
  def create
    @historia = Historia.new(historia_params)

    if @historia.save
      render json: @historia, status: :created, location: @historia
    else
      render json: @historia.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /historia/1
  def update
    if @historia.update(historia_params)
      render json: @historia
    else
      render json: @historia.errors, status: :unprocessable_entity
    end
  end

  # DELETE /historia/1
  def destroy
    @historia.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_historia
      @historia = Historia.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def historia_params
      params.expect(historia: [:titulo, :descricao, :finalizada, :status_id ])
    end
end
