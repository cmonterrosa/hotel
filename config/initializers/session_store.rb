# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_reservaciones_session',
  :secret      => '7f9daeb7d707f874366e47819acc00f3ed555de397562b4e1b17948b8787c6956dce372f3ed820eb72893ff3880f3ea4fa3b6cdd09e28ee0c32f90014887bc27'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
