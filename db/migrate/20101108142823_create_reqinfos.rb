class CreateReqinfos < ActiveRecord::Migration
  def self.up
    create_table :reqinfos do |t|
      t.string :first_name
      t.string :last_name
      t.string :address
      t.string :city
      t.string :state
      t.integer :zip
      t.string :email_address
      t.string :phone_number
      t.string :membership_application
      t.string :family_membership
      t.string :savings_account
      t.string :share_draft_account
      t.string :christmas_club_account
      t.string :money_market_account
      t.string :ira_savings
      t.string :ira_share_certificates
      t.string :share_certificates
      t.string :phone_vision
      t.string :overdraft_loan_information
      t.string :personal_loan_information
      t.string :automobile_loan_information
      t.string :heloc
      t.string :mortgage_loan_information
      t.string :visa_classic_card
      t.string :star_atm_card
      t.string :mastermoney_debit_card
      t.string :direct_deposit
      t.string :money_orders
      t.string :free_notary_service
      t.string :discount_tickets
      t.string :other_comments

      t.timestamps
    end
  end

  def self.down
    drop_table :reqinfos
  end
end
