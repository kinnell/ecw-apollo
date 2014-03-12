# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
Apollo::Application.config.secret_key_base = 'f7ab14700d2bdf1403b8d272ff367dd5d8670e4799c9005b7d98e6e30534bffcf48c07810ab861b309019412874dd6ecafc204278a5b8d17ee43461a174f5004'
