class ReviewsController < ApplicationController

  def new
    @review = Review.new
    @appointment = Appointment.find(params[:appointment_id])
  end

  def create
    @review = Review.new(review_params)
    @appointment = Appointment.find(params[:appointment_id])
    @review.appointment_id = @appointment.id
    if @review.save
      redirect_to appointments_path
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:title, :content,:rating)
  end
end
