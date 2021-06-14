class ApplicationController < ActionController::Base
  layout :set_layout
  # deviseコントローラにストロングパラメータを追加
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  # 編集画面から画像を受け取れるよう設定
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: %i(avatar name))
    devise_parameter_sanitizer.permit(:sign_up, keys: %i(avatar name))
  end

  private def set_layout
    if params[:controller].match(%r{\A(users|admins)/})
      Regexp.last_match[1]
    else
      "users"
    end
  end
end
