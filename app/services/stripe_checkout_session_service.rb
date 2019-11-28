class StripeCheckoutSessionService
  def call(event)
    order = Experience.find_by(checkout_session_id: event.data.object.id)
    order.update(state: 'paid')
    order.paid_at = Time.now
  end
end
