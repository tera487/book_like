class ApplicationController < ActionController::Base
  layout :set_layout

  private def set_layout
    if params[:controller].match(%r{\A(user|admin)/})
      Regexp.last_match[1]
    else
      "user"
    end
  end
end
