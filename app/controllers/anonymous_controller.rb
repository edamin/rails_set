class AnonymousController < ApplicationController
  def index
    render "#{params[:directory]}/index"
  end
end
