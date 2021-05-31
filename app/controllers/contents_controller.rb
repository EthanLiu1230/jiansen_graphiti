class ContentsController < ApplicationController
  def index
    contents = ContentResource.all(params)
    respond_with(contents)
  end

  def show
    content = ContentResource.find(params)
    respond_with(content)
  end

  def create
    content = ContentResource.build(params)

    if content.save
      render jsonapi: content, status: 201
    else
      render jsonapi_errors: content
    end
  end

  def update
    content = ContentResource.find(params)

    if content.update_attributes
      render jsonapi: content
    else
      render jsonapi_errors: content
    end
  end

  def destroy
    content = ContentResource.find(params)

    if content.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: content
    end
  end
end
