class StaticPagesController < ApplicationController
  before_filter :require_current_user!, :only => [:root]

  def home
  end

  def contact
  end

  def about
  end

  def root
  end
end
