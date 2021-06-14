class ApplicationController < ActionController::Base
  layout :set_layout

  private def set_layout
    if params[:controller].match(%r{\A(users|admins)/})
      Regexp.last_match[1]
    else
      "users"
    end
  end
end
