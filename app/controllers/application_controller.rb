class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    rescue_from Exception, with: :handle_500 unless Rails.env.development?

    # サインイン後のリダイレクト先をマイページへ
    def after_sign_in_path_for(resource)
        user_path(current_user.id)  #　指定したいパスに変更
    end

    # サインアウト後のリダイレクト先をトップページへ
    def after_sign_out_path_for(resource)
        root_path
    end

    def handle_500(exception = nil)
        logger.info "Rendering 500 with exception: #{exception.message}" if exception
    
        if request.xhr?
          # Ajaxのための処理
          render json: { error: '500 error' }, status: 500
        else
          render template: 'errors/error_500', status: 500, layout: 'application', content_type: 'text/html'
        end
      end
end
