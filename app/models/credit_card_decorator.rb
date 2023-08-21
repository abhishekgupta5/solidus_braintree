module CreditCardDecorator
  def self.included(base)
    base.include SolidusBraintree::SkipRequireCardNumbersConcern
    # base.include SolidusBraintree::AddNameValidationConcern
    base.include SolidusBraintree::UseDataFieldConcern
  end

  Spree::CreditCard.prepend(self)
end
