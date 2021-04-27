class ContactsController < ApplicationController

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    respond_to do |format|
      if @contact.deliver
        # re-initialize Home object for cleared form
        @contact = Contact.new
        binding.pry 
        format.html { redirect_to(home_index_path, success: "Thank you for your message. I'll get back to you soon!")}
        format.js   { flash.now[:success] = @message = "Thank you for your message. I'll get back to you soon!" }
      else

        format.html { redirect_to(home_index_path, error: "Message did not send.")}
        format.js   { flash.now[:error] = @message = "Message did not send." }
      end
    end
  end

  private

    def contact_params
      params.require(:contact).permit(:name, :subject, :email, :message, :location)
    end
end
