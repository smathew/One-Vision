# == Schema Information
# Schema version: 20101109135950
#
# Table name: loanapps
#
#  id                                 :integer         not null, primary key
#  loan_type                          :string(255)
#  line_of_credit_limit               :string(255)
#  purpose_of_loan                    :string(255)
#  credit_increase_limit              :string(255)
#  collateral_offered                 :string(255)
#  collateral_secured_limit           :string(255)
#  owned_by                           :string(255)
#  type_of_credit                     :string(255)
#  single_life_insurance              :string(255)
#  single_life_insurance_age          :string(255)
#  joint_life_insurance               :string(255)
#  joint_life_insurance_age           :string(255)
#  credit_disability_insurance        :string(255)
#  credit_disability_insurance_age    :string(255)
#  applicant_name                     :string(255)
#  applicant_account_number           :string(255)
#  applicant_ssn                      :string(255)
#  applicant_marital_status           :string(255)
#  applicant_drivers_license          :string(255)
#  applicant_drivers_license_state    :string(255)
#  applicant_date_of_birth            :string(255)
#  applicant_home_phone               :string(255)
#  applicant_business_phone           :string(255)
#  applicant_email_address            :string(255)
#  applicant_mortgage                 :string(255)
#  applicant_mortgage_balance         :string(255)
#  applicant_monthly_payment          :string(255)
#  applicant_current_apr              :string(255)
#  applicant_payment_responsible      :string(255)
#  applicant_monthly_payments         :string(255)
#  applicant_monthly_balances         :string(255)
#  applicant_employer                 :string(255)
#  applicant_income                   :string(255)
#  applicant_income_type              :string(255)
#  applicant_income_frequency         :string(255)
#  applicant_other_income_source      :string(255)
#  applicant_other_income             :string(255)
#  applicant_other_income_frequency   :string(255)
#  coapplicant_name                   :string(255)
#  coapplicant_account_number         :string(255)
#  coapplicant_ssn                    :string(255)
#  coapplicant_marital_status         :string(255)
#  coapplicant_drivers_license        :string(255)
#  coapplicant_drivers_license_state  :string(255)
#  coapplicant_date_of_birth          :string(255)
#  coapplicant_home_phone             :string(255)
#  coapplicant_business_phone         :string(255)
#  coapplicant_email_address          :string(255)
#  coapplicant_mortgage               :string(255)
#  coapplicant_mortgage_balance       :string(255)
#  coapplicant_monthly_payment        :string(255)
#  coapplicant_current_apr            :string(255)
#  coapplicant_payment_responsible    :string(255)
#  coapplicant_monthly_payments       :string(255)
#  coapplicant_monthly_balances       :string(255)
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

class Loanapp < ActiveRecord::Base
	validates_presence_of :loan_type, :purpose_of_loan, :type_of_credit, :applicant_name, :applicant_account_number, :applicant_ssn, :applicant_drivers_license, :applicant_drivers_license_state, :applicant_date_of_birth, :applicant_home_phone, :applicant_email_address, :applicant_employer, :applicant_income, :applicant_income_type, :applicant_income_frequency, :applicant_mortgage, :applicant_monthly_payment, :applicant_payment_responsible
	
	validates_presence_of :coapplicant_name, :coapplicant_account_number, :coapplicant_ssn, :coapplicant_drivers_license, :coapplicant_drivers_license_state, :coapplicant_date_of_birth, :coapplicant_home_phone, :coapplicant_email_address, :coapplicant_employer, :coapplicant_income, :coapplicant_income_type, :coapplicant_income_frequency, :if => :request_jointcredit?
	def request_jointcredit?
		type_of_credit == "Joint Credit"
	end

	#validating input for email address
	EmailRegex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates_format_of :applicant_email_address, :with => EmailRegex, :if => "!applicant_email_address.blank?"
	validates_format_of :coapplicant_email_address, :with => EmailRegex, :if => "!coapplicant_email_address.blank?"
	
	#validating input for any SSN entered
	SSNformat = /\A[0-9]{3}+-[0-9]{2}+-[0-9]{4}+\z/i
	validates_format_of :applicant_ssn, :with => SSNformat, :if => "!applicant_ssn.blank?"
	validates_format_of :coapplicant_ssn, :with => SSNformat, :if => "!coapplicant_ssn.blank?"
	
	#validating input for any phone numbers entered
	Phoneformat = /\A[0-9]{3}+-[0-9]{3}+-[0-9]{4}+\z/i
	validates_format_of :applicant_home_phone, :with => Phoneformat, :if => "!applicant_home_phone.blank?"
	validates_format_of :applicant_business_phone, :with => Phoneformat, :if => "!applicant_business_phone.blank?"
	validates_format_of :coapplicant_home_phone, :with => Phoneformat, :if => "!coapplicant_home_phone.blank?"
	validates_format_of :coapplicant_business_phone, :with => Phoneformat, :if => "!coapplicant_business_phone.blank?"
	
	#other validations
	validates_presence_of :line_of_credit_limit, :if => :request_lineofcredit?
	def request_lineofcredit?
		loan_type == "Line of Credit"
	end
	validates_presence_of :credit_increase_limit, :if => :request_creditincrease?
	def request_creditincrease?
		loan_type == "Credit Limit Increase"
	end
	validates_presence_of :collateral_secured_limit, :if => :request_collateralsecured?
	def request_collateralsecured?
		loan_type == "Collateral Secured"
	end
	
	 validates_presence_of :single_life_insurance_age, :if => :request_singleage?
	 validates_presence_of :joint_life_insurance_age, :if => :request_jointage?
	 validates_presence_of :credit_disability_insurance_age, :if => :request_disabilityage?
	 def request_singleage?
		single_life_insurance == "Yes"
	 end
	 def request_jointage?
		joint_life_insurance == "Yes"
	 end
	 def request_disabilityage?
		credit_disability_insurance == "Yes"
	 end
end
