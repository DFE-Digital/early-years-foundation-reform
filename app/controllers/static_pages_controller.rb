class StaticPagesController < ApplicationController
  before_action do |controller|
    @page = OpenStruct.new(title: t(params[:action], default: params[:action].humanize))
  end

  def accessibility_statement; end

  def disclaimer; end
end
