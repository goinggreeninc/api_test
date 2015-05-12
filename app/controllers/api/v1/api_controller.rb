module Api
  class Api::V1::ApiController < ApplicationController
    #skip_before_filter :verify_authenticity_token
    protect_from_forgery with: :null_session, :if => Proc.new { |c| c.request.format == 'application/json' }
    acts_as_token_authentication_handler_for User

    # Apply strong_parameters filtering before CanCan authorization
    # See https://github.com/ryanb/cancan/issues/571#issuecomment-10753675
    before_filter do
      resource = controller_name.singularize.to_sym
      method = "#{resource}_params"
      params[resource] &&= send(method) if respond_to?(method, true)
    end

    rescue_from CanCan::AccessDenied do |exception|
      respond_to do |format|
        format.json { render :json=> exception.to_json, :status => :forbidden }
      end
    end
  end
end
