class PoliciesController < ApplicationController
  before_action :set_policy, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  before_action :force_json, only: :search
  layout 'dashboard'

  # GET /policies or /policies.json
  def index
    @policies = Policy.all
  end

  def search
      q = params[:q].downcase
      @policies = Policy.where("name LIKE ?", "%#{q}%").limit(5)
  end


  # GET /policies/1 or /policies/1.json
  def show
  end

  # GET /policies/new
  def new
    @policy = Policy.new
  end

  # GET /policies/1/edit
  def edit
  end

  # POST /policies or /policies.json
  def create
    @policy = Policy.new(policy_params)

    respond_to do |format|
      if @policy.save
        format.html { redirect_to @policy, notice: "Policy was successfully created." }
        format.json { render :show, status: :created, location: @policy }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @policy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /policies/1 or /policies/1.json
  def update
    respond_to do |format|
      if @policy.update(policy_params)
        format.html { redirect_to @policy, notice: "Policy was successfully updated." }
        format.json { render :show, status: :ok, location: @policy }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @policy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /policies/1 or /policies/1.json
  def destroy
    @policy.destroy
    respond_to do |format|
      format.html { redirect_to policies_url, notice: "Policy was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_policy
      @policy = Policy.find(params[:id])
    end

    def force_json
      request.format = :json
    end


    # Only allow a list of trusted parameters through.
    def policy_params
      params.require(:policy).permit(:name, role_ids: [])
    end
end
