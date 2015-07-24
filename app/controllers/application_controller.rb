class ApplicationController < ActionController::Base
  include ActionController::RespondWith
  
  protect_from_forgery with: :exception
  
  
  
end
