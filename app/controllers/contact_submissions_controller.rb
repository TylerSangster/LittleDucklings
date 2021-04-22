class ContactSubmissionsController < InheritedResources::Base

  def create
    binding.pry
    ContactSubmission.create(params[:contact_submission])
  end

  private

    def contact_submission_params
      params.require(:contact_submission).permit(:name, :subject, :email, :message, :location)
    end

end
