class CreateMemberapps < ActiveRecord::Migration
  def self.up
    create_table :memberapps do |t|
      t.string :name
      t.string :salutation
      t.string :ssn
      t.string :date_of_birth
      t.string :joint_name
      t.string :joint_salutation
      t.string :joint_ssn
      t.string :joint_date_of_birth
      t.string :joint_privacy_code
      t.string :physical_address
      t.string :city
      t.string :state
      t.integer :zip
      t.string :mailing_address
      t.string :mailing_city
      t.string :mailing_state
      t.integer :mailing_zip
      t.string :home_phone
      t.string :business_phone
      t.string :membership_eligibility
      t.string :eligibility_description
      t.string :privacy_code
      t.string :email_address
      t.string :best_time_to_call
      t.string :us_citizen
      t.string :prime_savings
      t.string :other_savings
      t.string :mastermoney_debit_card
      t.string :phone_vision
      t.string :home_banking
      t.string :share_draft
      t.string :overdraft_protection

      t.timestamps
    end
  end

  def self.down
    drop_table :memberapps
  end
end
