class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    include SessionsHelper
    before_action :logged_in?

    def redirect_if_not_found
        logger.error"Attempt to access non-existent #{request.controller_class}#{params[:id]}"
        flash[:notice] = 'Sorry, but that doesn\'t exist.'
        redirect_to(root_url)
    end
end
