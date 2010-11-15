# == Schema Information
# Schema version: 20101110135744
#
# Table name: visarequests
#
#  id                                 :integer         not null, primary key
#  visa_card_account                  :string(255)
#  account_type                       :string(255)
#  credit_increase_on_account         :string(255)
#  account_number                     :string(255)
#  credit_limit_increase              :string(255)
#  other_credit_limit                 :string(255)
#  applicant_name                     :string(255)
#  applicant_address                  :string(255)
#  applicant_city                     :string(255)
#  applicant_state                    :string(255)
#  applicant_zip                      :integer
#  applicant_email_address            :string(255)
#  applicant_gross_monthly_income     :string(255)
#  applicant_ssn                      :string(255)
#  applicant_home_phone               :string(255)
#  applicant_work_phone               :string(255)
#  applicant_member_number            :string(255)
#  applicant_date_of_birth            :string(255)
#  applicant_employer                 :string(255)
#  applicant_income                   :string(255)
#  applicant_income_type              :string(255)
#  applicant_income_frequency         :string(255)
#  applicant_other_income_source      :string(255)
#  applicant_other_income             :string(255)
#  applicant_other_income_frequency   :string(255)
#  coapplicant_name                   :string(255)
#  coapplicant_address                :string(255)
#  coapplicant_city                   :string(255)
#  coapplicant_state                  :string(255)
#  coapplicant_zip                    :integer
#  coapplicant_email_address          :string(255)
#  coapplicant_gross_monthly_income   :string(255)
#  coapplicant_ssn                    :string(255)
#  coapplicant_home_phone             :string(255)
#  coapplicant_work_phone             :string(255)
#  coapplicant_member_number          :string(255)
#  coapplicant_date_of_birth          :string(255)
#  coapplicant_employer               :string(255)
#  coapplicant_income                 :string(255)
#  coapplicant_income_type            :string(255)
#  coapplicant_income_frequency       :string(255)
#  coapplicant_other_income_source    :string(255)
#  coapplicant_other_income           :string(255)
#  coapplicant_other_income_frequency :string(255)
#  created_at                         :datetime
#  updated_at                         :datetime
#

class Visarequest < ActiveRecord::Base
	validate :request_accountinfo
	def request_accountinfo
		errors.add(:base, "Please select if you wish to apply for a visa card account or increase the credit limit on the account or both") unless visa_card_account == "yes" or credit_increase_on_account == "yes"
	end 
	
	validates_presence_of :account_type, :if => :request_acctype?
	def request_acctype?
		visa_card_account == "yes"
	end 
	
	validates_presence_of :account_number, :credit_limit_increase, :if => :request_accountincrease?
	def request_accountincrease?
		credit_increase_on_account == "yes"
	end
	
	validates_presence_of :other_credit_limit, :if => :request_otheramt?
	def request_otheramt?
		credit_limit_increase == "Increase my credit limit by the amount specified"
	end 
	
	
	validates_presence_of :account_type, :applicant_name, :applicant_address, :applicant_city, :applicant_state, :applicant_zip, :applicant_email_address, :applicant_ssn, :applicant_home_phone, :applicant_date_of_birth, :applicant_employer, :applicant_income, :applicant_income_type, :applicant_income_frequency, :applicant_member_number
	
	validates_presence_of :coapplicant_name, :coapplicant_address, :coapplicant_city, :coapplicant_state, :coapplicant_zip, :coapplicant_email_address, :coapplicant_ssn, :coapplicant_home_phone, :coapplicant_member_number, :coapplicant_date_of_birth, :if => :request_jointinfo?
	def request_jointinfo?
		account_type == "Joint Account"
	end
	
	#validating input for email address
	EmailRegex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates_format_of :applicant_email_address, :with => EmailRegex, :if => "!applicant_email_address.blank?"
	validates_format_of :coapplicant_email_address, :with => EmailRegex, :if => "!coapplicant_email_address.blank?"
	
	#validating input for any phone numbers entered
	Phoneformat = /\A[0-9]{3}+-[0-9]{3}+-[0-9]{4}+\z/i
	validates_format_of :applicant_home_phone, :with => Phoneformat, :if => "!applicant_home_phone.blank?"
	validates_format_of :applicant_work_phone, :with => Phoneformat, :if => "!applicant_work_phone.blank?"
	validates_format_of :coapplicant_home_phone, :with => Phoneformat, :if => "!coapplicant_home_phone.blank?"
	validates_format_of :coapplicant_work_phone, :with => Phoneformat, :if => "!coapplicant_work_phone.blank?"
	
	#validating input for any SSN entered
	SSNformat = /\A[0-9]{3}+-[0-9]{2}+-[0-9]{4}+\z/i
	validates_format_of :applicant_ssn, :with => SSNformat, :if => "!applicant_ssn.blank?"
	validates_format_of :coapplicant_ssn, :with => SSNformat, :if => "!coapplicant_ssn.blank?"
	
end
