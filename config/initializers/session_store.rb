# # Be sure to restart your server when you modify this file.
# 
# # Your secret key for verifying cookie session data integrity.
# # If you change this key, all old sessions will become invalid!
# # Make sure the secret is at least 30 characters and all random, 
# # no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_APP_session',
  :secret      => '01f96f2b566b3865de2351367312c4c2de8c9f8f5c2ae9840aecc1d21c243013bf411f781848e49d6971f8fa03fca6bcc25c183e0c8aeff5b7279f8f61926802'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store

ActionController::Dispatcher.middleware.insert_before(ActionController::Base.session_store, FlashSessionCookieMiddleware, ActionController::Base.session_options[:key])