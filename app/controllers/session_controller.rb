class SessionController < ApplicationController

	def create
    @user = User.find_by_username(params[:username])
    @pass = User.find_by_password(params[:password])
    if @user && @pass
    	@ses = @user.id
    	render json: @user , status:  200
    else
    	render json: "Invalido" ,status: 404
    end
  end

def destroy
	@ses = nil
	render json: "La sesion ha sido cerrada", status: 200
end

 def savesession
    @username = @user.username
    @token =  SecureRandom.uuid.gsub(/\-/,'')
    @fechacreacion = Time.now
    
    @session = Session.new(parametro = {:username=>"La Marilla", :fecha=>"2016 .....", :token=>"qwefq45qwfadf3"})

 end

end
