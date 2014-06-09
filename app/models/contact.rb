class Contact < MailForm::Base
  attribute :name,      validate: true
  attribute :email
  validates_format_of :email, with: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :phone
  validates_format_of :phone, allow_blank: true, with: /\d{3}-\d{3}-\d{4}/, message: "needs to be in the format of xxx-xxx-xxxx"
  attribute :message,   validate: true
  attribute :file,      attachment: true
  attribute :nickname,  captcha: true

  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  def headers
    {
      :subject => "My Contact Form on shermanmeng.com",
      :to => ENV['GMAIL_USERNAME'], #"acrortest@gmail.com",
      :from => %("#{name}" <#{email}>)
    }
  end
end
