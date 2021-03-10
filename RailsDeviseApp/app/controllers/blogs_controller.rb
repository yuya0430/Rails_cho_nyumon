class BlogsController < ApplicationController
  layout 'blogs'

  def index
    @data = Blogpost.order('created_at desc').page params[:page]
    @blogconfig = Blogconfig.find 1
  end

  def genre
    @genre = Bloggenre.find params[:id]
    @data = Blogpost.where('bloggenre_id = ?',params[:id]).order('created_at desc').page params[:page]
    @blogconfig = Blogconfig.find 1
  end

  def show
    @blogpost = Blogpost.find params[:id]
    @blogconfig = Blogconfig.find 1
  end
end
