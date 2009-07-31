# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_drug_finder_session',
  :secret      => 'b157090a64ca882329855283c150898b0edd117811b5f4a37d434666266a6d215c5ea54943ab379ab2fbb7811ef4ad02c1c3a1aca0220e0240545996d23684a3'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
