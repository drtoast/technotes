# development.rb

# Don't send emails in development
config.action_mailer.delivery_method = :test



class Notifier < ActionMailer::Base
  default :from =>
    "Highrise <system@#{APPLICATION_DOMAIN}>" 

  def new_project(digest, project, person)
    @digest, @project, @person = digest, project, person

    attachments['digest.pdf'] = digest.to_pdf
    attachments['logo.jpg']   = File.read(project.logo_path)

    mail(
      :subject => "Your digest for #{project.name}",
      :to => person.email_address_with_name
    ) do |format|
      format.text { render :text => "Something texty" }
      format.html { render :text => "Something <i>texty</i>" }
    end
  end
end
