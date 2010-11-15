class Emailer < ActionMailer::Base
	def reqinfo_email(app)
		#Setting the content of the email
		recipients  "smathew@shareone.com"
		#recipients  "onevisionfcu@onevisionfcu.org"
		from        "web_services@shareone.com"
		subject     "Request for More Information"
		
		body :app => app
	end
	
	def memberapp_email(app)
		#Setting the content of the email
		recipients  "smathew@shareone.com"
		#recipients  "onevisionfcu@onevisionfcu.org, webapps@onevisionfcu.org"
		from        "web_services@shareone.com"
		subject     "[ ONE VISION FCU ] MEMBERSHIP APPLICATION (online forms)"
		
		body :app => app
	end
	
	def loanapp_email(app)
		#Setting the content of the email
		recipients  "smathew@shareone.com"
		#recipients  "onevisionfcu@onevisionfcu.org, webapps@onevisionfcu.org"
		from        "web_services@shareone.com"
		subject     "[ ONE VISION FCU ] LOAN APPLICATION (online forms)"
		
		body :app => app
	end
	
	def visarequest_email(app)
		#Setting the content of the email
		recipients  "smathew@shareone.com"
		#recipients  "onevisionfcu@onevisionfcu.org, webapps@onevisionfcu.org"
		from        "web_services@shareone.com"
		subject     "[ ONE VISION FCU ] VISA CARD REQUEST (online forms)"
		
		body :app => app
	end
end
