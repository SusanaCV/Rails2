class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  def authentication
  	authenticate_with_http_token do |token,options|
  	fechesita = Session.find_by(token: token)
  	if fechesita.fecha_creacion + 1 * 60 > Time.now
  	else
  	fechesita.destroy
  	render json: "Por Fin" , status: 200
  	end

  	end
  	
  end
end
