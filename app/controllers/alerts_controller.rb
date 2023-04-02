class AlertsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  load_and_authorize_resource

  # GET /alerts or /alerts.json
  def index
    @alerts = Alert.all
  end

  # GET /alerts/1 or /alerts/1.json
  def show
  end

  # GET /alerts/new
  def new
    @tags = Tag.all
  end

  # GET /alerts/1/edit
  def edit
  end

  # POST /alerts or /alerts.json
  def create
    @alert.user_id = current_user.id

    respond_to do |format|
      if @alert.save
        format.html { redirect_to alert_url(@alert), notice: "Alert was successfully created." }
        format.json { render :show, status: :created, location: @alert }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @alert.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /alerts/1 or /alerts/1.json
  def update
    respond_to do |format|
      if @alert.update(alert_params)
        format.html { redirect_to alert_url(@alert), notice: "Alert was successfully updated." }
        format.json { render :show, status: :ok, location: @alert }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @alert.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /alerts/1 or /alerts/1.json
  def destroy
    @alert.destroy

    respond_to do |format|
      format.html { redirect_to alerts_url, notice: "Alert was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def alert_params
    params.require(:alert).permit(
      :type,
      :name,
      :description,
      :origin,
      :user_id,
      tag_ids:[])
  end
end
