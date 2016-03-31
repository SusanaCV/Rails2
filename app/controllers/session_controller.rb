class SessionController < ApplicationController

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

    	render json: @token , status:  200
    else
    	render json: "Invalido" ,status: 404
    end
  end

def verificate
    @fechaexpiracion = @fechacreacion + 30 * 60
    
    render json: "La sesion ha sido cerrada", status: 200
end 

def destroy
    
    @ses = Session.where(token:=>"#{@token}")
	render json: @ses, status: 200
end


end
