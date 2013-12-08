class PagesController < ApplicationController
  def home
    respond_to do |format|
      format.html # new.html.erb
    end
  end
end