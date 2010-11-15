# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_OneVision_session',
  :secret      => '2d6c81fb41267a1b03d4d3b6fe7cf0aced748a8b8256d67eae032eaf2ac76c75232a68dacd2767d2e9768c1e379247d43b0b9c3680ff2a51e034d3d8a6062bd7'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
