class PagesController < ApplicationController
  def show
    @page = Page.find_by(title: params[:title])
    render template: 'pages/show'
  end
end