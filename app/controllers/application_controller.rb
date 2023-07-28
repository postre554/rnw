class ApplicationController < ActionController::Base

    def authorized_request(kind = nil)
        unless kind.include?(current_user.role)
            redirect_to posts_path, notice: "No estas autorizado para realizar esta accion"
        end
    end

end
