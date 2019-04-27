class PaymentGateway::ServiceError < StandardError
    attr_reader :exception_message
    
    def initialize(message, exception_message: nil)
      # Call the parent's constructor to set the message
      super(message)
  
      # Store the exception_message in an instance variable
      @exception_message = exception_message
    end
  end
  
  class PaymentGateway::CreateSubscriptionServiceError < PaymentGateway::ServiceError
  end
  
  class PaymentGateway::CreatePlanServiceError < PaymentGateway::ServiceError
  end
  
  class PaymentGateway::CreateCustomerServiceError < PaymentGateway::ServiceError
  end
  
  class PaymentGateway::StripeClientError < PaymentGateway::ServiceError
  end