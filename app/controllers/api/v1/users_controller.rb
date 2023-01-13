class Api::V1::UsersController < ApplicationController
  before_action :authorize_request, only: %i[ show update destroy ]
  before_action :set_user, only: %i[ show update destroy ]

  # GET /api/v1/users
  def index
    @users = User.all

    render json: @users
  end

  # GET /api/v1/users/1
  def show
    render json: @user
  end

  # POST /api/v1/users
  def create
    @user = User.new(json_params)

    if @user.save
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/users/1
  def update
    if @user.update(json_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted JSON parameters through.
    def json_params
      allowed_data = %(email password description).freeze
      json_payload.select { |allow| allowed_data.include?(allow) }
    end
end
