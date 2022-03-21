class User < ApplicationRecord
    has_secure_password

    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, presence: true, uniqueness: true

    require 'sendgrid-ruby'
    include SendGrid

    def send_email
        client_email = self.email

        from = Email.new(email: 'danielid132@gmail.com')
        to = Email.new(email: client_email)
        subject = "Successful registration - Disney API"
        content = Content.new(type: 'text/plain', value: "Welcome to our disney characters API,\n\nThanks for registering")
        mail = Mail.new(from, subject, to, content)    
        sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
        response = sg.client.mail._('send').post(request_body: mail.to_json)
        puts response.status_code
        puts response.body
        puts response.headers
    end
end
