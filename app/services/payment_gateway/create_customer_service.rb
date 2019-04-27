class PaymentGateway::CreateCustomerService < Service
    EXCEPTION_MESSAGE = "There was an error while creating the customer"
    attr_accessor :user
  
    def initialize(user: )
      @user = user
    end
  
    def run
      begin
        User.transaction do
          client.create_customer!(email: user.email).tap do |customer|
            user.update!(payment_gateway_customer_identifier: customer.id)
          end
        end
      rescue ActiveRecord::RecordInvalid,
        PaymentGateway::ClientError => e
        raise PaymentGateway::CreateCustomerService.new(
          EXCEPTION_MESSAGE,
          exception_message: e.message)
      end
    end
  end