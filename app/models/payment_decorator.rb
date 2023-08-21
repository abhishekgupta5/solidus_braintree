module PaymentDecorator
  def self.included(base)
    base.include SolidusBraintree::PaymentBraintreeNonceConcern
    base.include SolidusBraintree::InjectDeviceDataConcern
  end

  Spree::Payment.prepend(self)
end
