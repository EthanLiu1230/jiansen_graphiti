class PagesController < ApplicationController
  def index
    pages = PageResource.all(params)
    respond_with(pages)
  end

  def show
    page = PageResource.find(params)
    respond_with(page)
  end

  def create
    page = PageResource.build(params)

    if page.save
      render jsonapi: page, status: 201
    else
      render jsonapi_errors: page
    end
  end

  def update
    page = PageResource.find(params)

    if page.update_attributes
      render jsonapi: page
    else
      render jsonapi_errors: page
    end
  end

  def destroy
    page = PageResource.find(params)

    if page.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: page
    end
  end
end
