class ApplicationController < ActionController::Base
  include AdminSessionsHelper
  include SchoolSessionsHelper
  include StudentSessionsHelper
end
