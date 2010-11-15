# == Schema Information
# Schema version: 20101108170701
#
# Table name: memberapps
#
#  id                      :integer         not null, primary key
#  name                    :string(255)
#  salutation              :string(255)
#  ssn                     :string(255)
#  date_of_birth           :string(255)
#  joint_name              :string(255)
#  joint_salutation        :string(255)
#  joint_ssn               :string(255)
#  joint_date_of_birth     :string(255)
#  joint_privacy_code      :string(255)
#  physical_address        :string(255)
#  city                    :string(255)
#  state                   :string(255)
#  zip                     :integer
#  mailing_address         :string(255)
#  mailing_city            :string(255)
#  mailing_state           :string(255)
#  mailing_zip             :integer
#  home_phone              :string(255)
#  business_phone          :string(255)
#  membership_eligibility  :string(255)
#  eligibility_description :string(255)
#  privacy_code            :string(255)
#  email_address           :string(255)
#  best_time_to_call       :string(255)
#  us_citizen              :string(255)
#  prime_savings           :string(255)
#  other_savings           :string(255)
#  mastermoney_debit_card  :string(255)
#  phone_vision            :string(255)
#  home_banking            :string(255)
#  share_draft             :string(255)
#  overdraft_protection    :string(255)
#  created_at              :datetime
#  updated_at              :datetime
#

class Memberapp < ActiveRecord::Base
	validates_presence_of :name, :ssn, :date_of_birth, :physical_address, :city, :state, :zip, :home_phone, :membership_eligibility, :eligibility_description, :privacy_code, :email_address
	
	#validating input for email address
	EmailRegex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates_format_of :email_address, :with => EmailRegex, :if => "!email_address.blank?"
	
	#validating input for any SSN entered
	SSNformat = /\A[0-9]{3}+-[0-9]{2}+-[0-9]{4}+\z/i
	validates_format_of :ssn, :with => SSNformat, :if => "!ssn.blank?"
	validates_format_of :joint_ssn, :with => SSNformat, :if => "!joint_ssn.blank?"
	
	#validating input for any phone numbers entered
	Phoneformat = /\A[0-9]{3}+-[0-9]{3}+-[0-9]{4}+\z/i
	validates_format_of :home_phone, :with => Phoneformat, :if => "!home_phone.blank?"
	validates_format_of :business_phone, :with => Phoneformat, :if => "!business_phone.blank?"
		
	#validating to see if zip has got only integer values
	zipformat = /\A[0-9]{5}+\z/i
	validates_format_of :zip, :with => zipformat, :if => "!zip.blank?"
	validates_format_of :mailing_zip, :with => zipformat, :if => "!mailing_zip.blank?"
	
	#other validations
	validates_presence_of :overdraft_protection, :if => :request_protectionplan?
	def request_protectionplan?
		share_draft == "yes"
	end
	
	validates_presence_of :joint_ssn, :joint_date_of_birth, :joint_privacy_code, :if => "!joint_name.blank?"
end
