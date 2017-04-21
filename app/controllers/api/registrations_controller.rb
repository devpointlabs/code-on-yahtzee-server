class Api::RegistrationsController < DeviseTokenAuth::RegistrationsController
  def create
    super do |resource|
      sign_in(resource)
      res = resource.create_new_auth_token
      render json: {
        id: resource.id,
        email: resource.email,
        nickname: resource.nickname,
        client: res['client'],
        token: res['access-token']
      } and return
    end
  end
end