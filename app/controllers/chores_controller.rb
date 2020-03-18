class ChoresController < ApplicationController
  before_action :set_chore, only: [:show, :edit, :update, :destroy, :toggle_complete]
  
  def toggle_complete
    respond_to do |format|
      if @chore.update(complete: toggle_complete_param)
        format.html { redirect_to chores_path, notice: 'Chore was successfully updated.' }
        format.json { render :show, status: :ok, location: @chore }
      else
        format.html { redirect_to chores_path, notice: 'Cannot toggle chore complete: ' + @chore.errors.full_messages.join('; ') }
        format.json { render json: @chore.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /chores
  # GET /chores.json
  def index
    @tasks = Task.all.order(name: :asc)
    if params[:child_id]
      @child = Child.find(params[:child_id])
      @chores = @child.chores
    else
      @chores = Chore.all
    end
  end

  # GET /chores/1
  # GET /chores/1.json
  def show
  end

  # GET /chores/new
  def new
    @children = Child.all
    @tasks = Task.all
    @chore = Chore.new
  end

  # GET /chores/1/edit
  def edit
    @children = Child.all
    @tasks = Task.all
  end

  # POST /chores
  # POST /chores.json
  def create
    @chore = Chore.new(chore_params)

    respond_to do |format|
      if @chore.save
        format.html { redirect_to chores_path, notice: 'Chore was successfully created.' }
        format.json { render :show, status: :created, location: @chore }
      else
        @children = Child.all
        @tasks = Task.all
        format.html { render :new }
        format.json { render json: @chore.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /chores/1
  # PATCH/PUT /chores/1.json
  def update
    respond_to do |format|
      if @chore.update(chore_params)
        format.html { redirect_to chores_path, notice: 'Chore was successfully updated.' }
        format.json { render :show, status: :ok, location: @chore }
      else
        @children = Child.all
        @tasks = Task.all
        format.html { render :edit }
        format.json { render json: @chore.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chores/1
  # DELETE /chores/1.json
  def destroy
    @chore.destroy
    respond_to do |format|
      format.html { redirect_to chores_path, notice: 'Chore was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chore
      @chore = Chore.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def chore_params
      params.require(:chore).permit(:child_id, :name, :complete, :thumbnail, :task_id)
    end

    def toggle_complete_param
      params.fetch(:chore, {}).fetch(:complete, !@chore.complete)
    end
end
