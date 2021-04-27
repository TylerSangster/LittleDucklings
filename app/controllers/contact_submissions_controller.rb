class ContactSubmissionsController < InheritedResources::Base

  def create
    # binding.pry
    # @contact_submission = ContactSubmission.new(contact_submission_params)

    # if @contact_submission.save
    #   redirect_to :action => 'index'
    # else

    #   render :action => 'new'
    # end
    
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
