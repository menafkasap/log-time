class TimeLogsController < ApplicationController
  before_action :set_time_log, only: [:show, :edit, :update, :destroy]

  # GET /time_logs
  # GET /time_logs.json
  def index
    @users = User.all
    @time_logs = TimeLog.where(nil)
    filtering_params(params).each do |key, value|
      value = parse_time(key, value) if %w(start_time finish_time).include? key
      @time_logs = @time_logs.public_send("filter_by_#{key}", value) if value.present?
    end
  end

  # GET /time_logs/1
  # GET /time_logs/1.json
  def show
  end

  # GET /time_logs/new
  def new
    @time_log = TimeLog.new
  end

  # GET /time_logs/1/edit
  def edit
  end

  # POST /time_logs
  # POST /time_logs.json
  def create
    @time_log = TimeLog.new(time_log_params)
    @time_log.user_id = current_user.id

    respond_to do |format|
      if @time_log.save
        format.html { redirect_to :root, notice: 'Zaman kaydı başarıyla oluşturuldu' }
        format.json { render :show, status: :created, location: @time_log }
      else
        format.html { render :new }
        format.json { render json: @time_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /time_logs/1
  # PATCH/PUT /time_logs/1.json
  def update
    respond_to do |format|
      if @time_log.update(time_log_params)
        format.html { redirect_to @time_log, notice: 'Time log was successfully updated.' }
        format.json { render :show, status: :ok, location: @time_log }
      else
        format.html { render :edit }
        format.json { render json: @time_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /time_logs/1
  # DELETE /time_logs/1.json
  def destroy
    @time_log.destroy
    respond_to do |format|
      format.html { redirect_to time_logs_url, notice: 'Time log was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_time_log
    @time_log = TimeLog.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def time_log_params
    params.require(:time_log).permit(:comment, :time_type, :start_time, :finish_time, :user_id)
  end

  # A list of the param names that can be used for filtering the Time Log list
  def filtering_params(params)
    params.slice(:user_ids, :time_type, :start_time, :finish_time)
  end

  # A list of the param names that can be used for filtering the Time Log list
  def parse_time(key, value)
    Time.zone.local(*(1..5).map { |i| value["{:id=>\"#{key.sub("_","-")}\"}(#{i}i)"]})
  end
end
