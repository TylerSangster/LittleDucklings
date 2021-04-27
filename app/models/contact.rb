class Contact < MailForm::Base
  attribute :name,      :validate => true
  attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
 
  attribute :subject, :validate => true
  attribute :location
  attribute :message, :validate => true

  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  def headers
    {
      :subject => "#{location} > #{subject} ",
      :to => "tylersangster@gmail.com",
      :from => %("#{name}" <#{email}>)
    }
  end
end