class PaymentGateway::GetPlanService < Service
  attr_accessor :payment_gateway_event_identifier

  def initialize(payment_gateway_event_identifier: )
    @payment_gateway_event_identifier = payment_gateway_event_identifier
  end

  def run
    begin
   	  get_client_event
    rescue PaymentGateway::ClientError => e
      raise CreatePlanServiceError.new("There was an error while retreiving the event", exception_message: e.message)
    end
  end

  private def get_client_event
    client.lookup_plan(identifier: payment_gateway_event_identifier)
  end
end
