class CreateLoanapps < ActiveRecord::Migration
  def self.up
    create_table :loanapps do |t|
      t.string :loan_type
      t.string :line_of_credit_limit
      t.string :purpose_of_loan
      t.string :credit_increase_limit
      t.string :collateral_offered
      t.string :collateral_secured_limit
      t.string :owned_by
      t.string :type_of_credit
      t.string :single_life_insurance
      t.string :single_life_insurance_age
      t.string :joint_life_insurance
      t.string :joint_life_insurance_age
      t.string :credit_disability_insurance
      t.string :credit_disability_insurance_age
      t.string :applicant_name
      t.string :applicant_account_number
      t.string :applicant_ssn
      t.string :applicant_marital_status
      t.string :applicant_drivers_license
      t.string :applicant_drivers_license_state
      t.string :applicant_date_of_birth
      t.string :applicant_home_phone
      t.string :applicant_business_phone
      t.string :applicant_email_address
      t.string :applicant_mortgage
      t.string :applicant_mortgage_balance
      t.string :applicant_monthly_payment
      t.string :applicant_current_apr
      t.string :applicant_payment_responsible
      t.string :applicant_monthly_payments
      t.string :applicant_monthly_balances
      t.string :applicant_employer
      t.string :applicant_income
      t.string :applicant_income_type
      t.string :applicant_income_frequency
      t.string :applicant_other_income_source
      t.string :applicant_other_income
      t.string :applicant_other_income_frequency
      t.string :coapplicant_name
      t.string :coapplicant_account_number
      t.string :coapplicant_ssn
      t.string :coapplicant_marital_status
      t.string :coapplicant_drivers_license
      t.string :coapplicant_drivers_license_state
      t.string :coapplicant_date_of_birth
      t.string :coapplicant_home_phone
      t.string :coapplicant_business_phone
      t.string :coapplicant_email_address
      t.string :coapplicant_mortgage
      t.string :coapplicant_mortgage_balance
      t.string :coapplicant_monthly_payment
      t.string :coapplicant_current_apr
      t.string :coapplicant_payment_responsible
      t.string :coapplicant_monthly_payments
      t.string :coapplicant_monthly_balances
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
    drop_table :loanapps
  end
end
