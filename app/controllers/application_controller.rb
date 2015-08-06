class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :troubletype_sidebar

  def troubletype_sidebar
    @trouble_types = TroubleType.all
  end

  # after_filter :flash_to_headers

  # def flash_to_headers
  #   if request.xhr?
  #   	flash_json = Hash[flash.map{|k,v| [k, ERB::Util.h(v)] }].to_json
  #   	response.headers['X-Flash-Messages'] = flash_json
  #   	puts flash_json
  #     flash.discard 
  #   end
  # end

  # private

  #   def flash_message
  #       [:error, :warning, :notice].each do |type|
  #           return flash[type] unless flash[type].blank?
  #       end
  #   end

  #   def flash_type
  #       [:error, :warning, :notice].each do |type|
  #           return type unless flash[type].blank?
  #       end
  #   end	
end
