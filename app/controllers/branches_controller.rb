class BranchesController < ApplicationController
  before_action :set_branch, only: [:show, :edit, :update, :destroy]

  # GET /branches
  # GET /branches.json
  def index
    @branches = current_user.branches.all.page(params[:page]).per(20)
  end

  # GET /branches/1
  # GET /branches/1.json
  def show
  end

  # GET /branches/new
  def new
    @branch = current_user.branches.build
  end

  # GET /branches/1/edit
  def edit
  end

  # POST /branches
  # POST /branches.json
  def create
    @branch = current_user.branches.build(branch_params)

    respond_to do |format|
      if @branch.save
        format.html { redirect_to @branch, notice: 'Filial criada com sucesso.' }
        format.json { render :show, status: :created, location: @branch }
      else
        format.html { render :new }
        format.json { render json: @branch.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /branches/1
  # PATCH/PUT /branches/1.json
  def update
    respond_to do |format|
      if @branch.update(branch_params)
        format.html { redirect_to @branch, notice: 'Filial atualizada com sucesso.' }
        format.json { render :show, status: :ok, location: @branch }
      else
        format.html { render :edit }
        format.json { render json: @branch.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /branches/1
  # DELETE /branches/1.json
  def destroy
    @branch.destroy
    respond_to do |format|
      format.html { redirect_to branches_url, notice: 'Filial deletada com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_branch
      @branch = current_user.branches.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def branch_params
      params.require(:branch).permit(:name, :phone, :city_id, :user_id)
    end
end
