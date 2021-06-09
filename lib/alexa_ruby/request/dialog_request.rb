module AlexaRuby
  # DialogRequest class implements Alexa "Dialog.API.Invoked" request type
  class DialogRequest < BaseRequest
    attr_reader :request_name, :arguments

    # Initialize new Dialog request
    #
    # @param request [Hash] valid request from Amazon Alexa service
    def initialize(request)
      @type = :dialog
      super
      if @req[:request][:apiRequest].nil?
        raise ArgumentError, 'apiRequest must be defined'
      end
      @apiRequest = @req[:request][:apiRequest]
      @request_name = @apiRequest[:name]
      @arguments = @apiRequest[:arguments]
    end
  end
end
