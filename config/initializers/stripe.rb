Rails.configuration.stripe = {

  signing_secret:  ENV['STRIPE_WEBHOOK_SECRET_KEY']
}

StripeEvent.signing_secret = Rails.configuration.stripe[:signing_secret]
StripeEvent.configure do |events|
  events.subscribe 'checkout.session.completed', StripeCheckoutSessionService.new
end
