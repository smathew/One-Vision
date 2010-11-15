# == Schema Information
# Schema version: 20101108142823
#
# Table name: reqinfos
#
#  id                          :integer         not null, primary key
#  first_name                  :string(255)
#  last_name                   :string(255)
#  address                     :string(255)
#  city                        :string(255)
#  state                       :string(255)
#  zip                         :integer
#  email_address               :string(255)
#  phone_number                :string(255)
#  membership_application      :string(255)
#  family_membership           :string(255)
#  savings_account             :string(255)
#  share_draft_account         :string(255)
#  christmas_club_account      :string(255)
#  money_market_account        :string(255)
#  ira_savings                 :string(255)
#  ira_share_certificates      :string(255)
#  share_certificates          :string(255)
#  phone_vision                :string(255)
#  overdraft_loan_information  :string(255)
#  personal_loan_information   :string(255)
#  automobile_loan_information :string(255)
#  heloc                       :string(255)
#  mortgage_loan_information   :string(255)
#  visa_classic_card           :string(255)
#  star_atm_card               :string(255)
#  mastermoney_debit_card      :string(255)
#  direct_deposit              :string(255)
#  money_orders                :string(255)
#  free_notary_service         :string(255)
#  discount_tickets            :string(255)
#  other_comments              :string(255)
#  created_at                  :datetime
#  updated_at                  :datetime
#

class Reqinfo < ActiveRecord::Base
	validates_presence_of :first_name, :last_name, :email_address, :phone_number, :address, :city, :state, :zip
	
	#validating input for email address
	EmailRegex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates_format_of :email_address, :with => EmailRegex, :if => "!email_address.blank?"
	
	#validating input for any phone numbers entered
	Phoneformat = /\A[0-9]{3}+-[0-9]{3}+-[0-9]{4}+\z/i
	validates_format_of :phone_number, :with => Phoneformat, :if => "!phone_number.blank?"
end
