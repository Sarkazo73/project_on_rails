class Admin::CarriagesController < Admin::BaseController
  before_action :set_train
  before_action :set_carriage, only: [:show, :edit, :update, :destroy]

  def index
    @carriages = @train.carriages
  end

  def show
  end

  def new
    @carriage = @train.carriages.build
  end

  def create
    @carriage = @train.carriages.build(carriage_params)

    if @carriage.save
      redirect_to admin_train_carriage_path(@train.id, @carriage.id)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @carriage.update(carriage_params)
      redirect_to admin_train_carriage_path(@train.id, @carriage.id)
    else
      render :edit
    end
  end

  def destroy
    @carriage.destroy
    redirect_to admin_train_carriages_path(@train.id, @carriage.id)
  end

  private

  def set_train
    @train = Train.find(params[:train_id])
  end

  def set_carriage
    @carriage = @train.carriages.find(params[:id])
  end

  def carriage_params
    params.require(:carriage).permit(:number, :train_id, :type)
  end
end