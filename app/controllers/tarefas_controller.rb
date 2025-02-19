class TarefasController < ApplicationController
  before_action :set_tarefa, only: %i[ show update destroy ]

  # GET /tarefas
  def index
    @q = Tarefa.ransack(params[:q])
    @pagy, @tarefas = pagy(@q.result)

    render json: { tarefa: @tarefas, pagy: @pagy }
  end

  # GET /tarefas/1
  def show
    render json: @tarefa
  end

  # POST /tarefas
  def create
    @tarefa = Tarefa.new(tarefa_params)

    if @tarefa.save
      render json: @tarefa, status: :created, location: @tarefa
    else
      render json: @tarefa.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tarefas/1
  def update
    if @tarefa.update(tarefa_params)
      render json: @tarefa
    else
      render json: @tarefa.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tarefas/1
  def destroy
    @tarefa.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tarefa
      @tarefa = Tarefa.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def tarefa_params
      params.expect(tarefa: [ :titulo, :descricao, :finalizada, :status_id, :historia_id ])
    end
end
