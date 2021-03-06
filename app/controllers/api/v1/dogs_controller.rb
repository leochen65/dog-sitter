#USER ID?
class Api::V1::DogsController < Api::V1::BaseController
  before_action :set_dog, only: [:update, :destroy]

  def index
    @dogs = Dog.all
  end

  def show
    @dog = Dog.find(params[:id])
  end

  def create
    # byebug
    @user = User.find(params[:user_id])
    @dog = Dog.new(dog_params)
    @dog.user = @user

    if @dog.save
      render :show, status: :created
    else
      render json: { errors: @dog.errors.full_messages },
        status: :unprocessable_entity
    end
  end

  def update
    if @dog.update(dog_params)
      render :show
    else
      render json: { errors: @dog.errors.full_messages },
        status: :unprocessable_entity
    end
  end

  def destroy
    if @dog.destroy
      render :index
    else
      render json: { errors: @dog.errors.full_messages },
        status: :unprocessable_entity
    end
  end



  private

  def set_dog
    @dog = Dog.find(params[:id])
  end

  def dog_params
    params.require(:dog).permit(:breed, :name, :gender, :age, :medical_history, :image_url, :user_id)
  end

  def render_error
    render json: { errors: @dog.errors.full_messages },
      status: :unprocessable_entity
  end
end
