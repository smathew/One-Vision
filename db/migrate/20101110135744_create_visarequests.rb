class CreateVisarequests < ActiveRecord::Migration
  def self.up
    create_table :visarequests do |t|
      t.string :visa_card_account
      t.string :account_type
      t.string :credit_increase_on_account
      t.string :account_number
      t.string :credit_limit_increase
      t.string :other_credit_limit
      t.string :applicant_name
      t.string :applicant_address
      t.string :applicant_city
      t.string :applicant_state
      t.integer :applicant_zip
      t.string :applicant_email_address
      t.string :applicant_gross_monthly_income
      t.string :applicant_ssn
      t.string :applicant_home_phone
      t.string :applicant_work_phone
      t.string :applicant_member_number
      t.string :applicant_date_of_birth
      t.string :applicant_employer
      t.string :applicant_income
      t.string :applicant_income_type
      t.string :applicant_income_frequency
      t.string :applicant_other_income_source
      t.string :applicant_other_income
      t.string :applicant_other_income_frequency
      t.string :coapplicant_name
      t.string :coapplicant_address
      t.string :coapplicant_city
      t.string :coapplicant_state
      t.integer :coapplicant_zip
      t.string :coapplicant_email_address
      t.string :coapplicant_gross_monthly_income
      t.string :coapplicant_ssn
      t.string :coapplicant_home_phone
      t.string :coapplicant_work_phone
      t.string :coapplicant_member_number
      t.string :coapplicant_date_of_birth
      t.string :coapplicant_employer
      t.string :coapplicant_income
      t.string :coapplicant_income_type
      t.string :coapplicant_income_frequency
      t.string :coapplicant_other_income_source
      t.string :coapplicant_other_income
      t.string :coapplicant_other_income_frequency

      t.timestamps
    end
  end

  def self.down
    drop_table :visarequests
  end
end
