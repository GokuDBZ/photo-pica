Rails.configuration.stripe = {
    :publishable_key => ENV["PUBLISHABLE_KEY"],
    :secre_key => ENV["SECRET_KEY"]
}

Stripe.api_key = Rails.configuration.stripe["secret_key"]