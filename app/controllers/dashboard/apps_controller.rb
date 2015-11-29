class Dashboard::AppsController < Dashboard::ApplicationController
  before_action :set_app, only: [:show, :edit, :update, :destroy]

  def index
    @apps = App.all
  end

  def show
  end

  def new
    @app = current_user.apps.new
  end

  def create
    @app = App.new(app_params)

    respond_to do |format|
      if @app.save
        format.html { redirect_to dashboard_app_url(@app), notice: t('.success') }
      else
        format.html { render :new }
      end
    end
  end

  def destroy
    @app.destroy
    respond_to do |format|
      format.html { redirect_to dashboard_apps_url, notice: t('.success') }
    end
  end

  private
  def set_app
    @app = App.find(params[:id])
  end

  def app_params
    params.require(:app).permit(:name)
  end
end
