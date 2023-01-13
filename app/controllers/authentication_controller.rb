class AuthenticationController < ApplicationController
  
  # POST /auth/login
  def login
    allowed_data = %(email password).freeze
    expiration = 24
    data = json_payload.select { |allow| allowed_data.include?(allow) }
    @user = User.find_by_email!(data[:email])
    if @user.authenticate(data[:password])
      token = JsonWebToken.encode(user_id: @user.id, exp: expiration)
      time = Time.now + expiration.hours.to_i
      render json: {
        token:,
        exp: time.strftime('%m-%d-%Y %H:%M'),
        email: @user.email,
        id: @user.id
      },
      status: :ok
    else
      render json: { error: 'Unauthorized' }, status: :unauthorized
    end
  rescue ActiveRecord::RecordNotFound
    render json: { errors: 'Email not found' }, status: :not_found
  end
end
