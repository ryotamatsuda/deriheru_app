class Admins::OperatorsController < ApplicationController
  before_action :authenticate_admin!
  def index
  end

  def show
  end

  def new
    @operator = Operator.new
  end

  def create
    @operator = Operator.new(operator_params)
    @operator.password = Rails.application.credentials.operator[:default_password]
    if @operator.save
      redirect_to admins_operators_path
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def operator_params
    params.require(:operator).permit(:login_id, :name)
  end
end
