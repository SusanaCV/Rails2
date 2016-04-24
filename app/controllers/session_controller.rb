class SessionController < ApplicationController
skip_before_action :authentication, only:[:destroy]
    @tok = nil
	def create
    @user = User.find_by_username(params[:username])
    @pass = User.find_by_password(params[:password])
    if @user && @pass
        @token =  SecureRandom.uuid.gsub(/\-/,'')
        @fechacreacion = Time.now
        @fechaexpiracion = @fechacreacion + 30 * 60
        parametros = {:fecha_creacion=>"#{@fechacreacion}",:username=>"#{@user.username}", :token=>"#{@token}"}
        parametros.to_json
        session = Session.new(parametros)
        session.save
        @tok = @token
    	render json: @token , status:  200
    else
    	render json: "User or password invalid" ,status: 422
    end
  end

def verificate
    @fechaexpiracion = @fechacreacion + 30 * 60
    
    render json: "La sesion ha sido cerrada", status: 200
end 

def destroy
    
    authenticate_with_http_token do |token, options|
    @ses = Session.find_by(token: token)  
    @ses.destroy 
    end
    
	render json: "Sesión cerrada correctamente", status: 200
end

end
