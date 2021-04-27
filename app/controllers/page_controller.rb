class PageController < ApplicationController

  layout "disable_navbar", only: [:coming_soon]
  # layout "locations", only: [:locations]
  # before_action :authenticate_user!, only: [:home]

  def coming_soon
  end

  def home


    @notices = Notice.published
    @location = "Little Ducklings"
    @contact_submission = ContactSubmission.new 
  end

  def lake
    @location = "Little Ducklings Lake"
    @contact = Contact.new
    @notices = Notice.published
  end

  def pond
    @location = "Little Ducklings Pond"

    @notices = Notice.published
    # flash.now[:danger] = "We have flash messages"
  end

  def locations
    @notices = Notice.published
    render layout: "locations"
  end

  def create_contact_form
    @contact_submission = ContactSubmission.new(contact_submission_params)
    @contact = Contact.new(contact_submission_params)
    @contact.request = request
    respond_to do |format|
      binding.pry
      if @contact_submission.save and @contact.deliver
        # re-initialize Home object for cleared form
        @contact_submission = ContactSubmission.new
        binding.pry 
        format.html { redirect_back(fallback_location: home_path , success: "Thank you for your message. I'll get back to you soon!") }
        format.js   { flash.now[:success] = @message = "Thank you for your message. I'll get back to you soon!" }
      else

        format.html { render(:action => 'new' , error: "Message did not send.")}
        format.js   { flash.now[:error] = @message = "Message did not send." }
      end
    end
  end

  private
  
    def contact_submission_params
      params.require(:contact_submission).permit(:name, :subject, :email, :message, :location)
    end
end
