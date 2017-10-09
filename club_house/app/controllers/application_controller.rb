class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def errors_template(objd)

    number_of_errors=objd.errors.count
    if number_of_errors<=1
      flash.now[:danger] = "The user has not been saved. You have #{number_of_errors} error."
    else
      flash.now[:danger] = "The user has not been saved. You have #{number_of_errors} errors."
    end
  end


end
