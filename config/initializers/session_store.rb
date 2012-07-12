# Be sure to restart your server when you modify this file.

InstagramLogin::Application.config.session_store :cookie_store, key: '_instagram-login_session'

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rails generate session_migration")
# InstagramLogin::Application.config.session_store :active_record_store
