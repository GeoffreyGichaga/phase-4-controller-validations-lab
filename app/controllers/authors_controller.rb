class AuthorsController < ApplicationController

  rescue_from ActiveRecord::RecordInvalid,with: :render_record_invalid_error
  
  def show
    author = Author.find(params[:id])

    render json: author
  end

  def create
    author = Author.create!(author_params)

    render json: author, status: :created
  end

  private
  
  def author_params
    params.permit(:email, :name)
  end

  def render_record_invalid_error(invalid)
    render json: { errors: invalid.record.errors }, status: :unprocessable_entity
  end 

  # def render_record_not_found_error
  #   render json: {error: "Author not Found"},status: :not_found
  # end 
  
end
