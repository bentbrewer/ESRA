class ApplicationController < ActionController::Base
  protect_from_forgery
  include Hobo::Controller::AuthenticationSupport
  before_filter :except => [:login, :forgot_password, :accept_invitation, :do_accept_invitation] do
     login_required unless User.count == 0
  end
end
