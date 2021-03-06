# frozen_string_literal: true

module Billomat
  module Actions
    ##
    # Completes an invoice by calling the /complete path on a resource
    class Complete
      ##
      # Returns a Complete object
      #
      # @param [String] invoice_id The ID of the invoice
      # @param [Hash] opts The options for this request
      # @return [Billomat::Actions::Complete]
      #
      # @example
      #   Billomat::Actions::Complete('12345', { template_id: '10231' })
      def initialize(invoice_id, opts = {})
        @invoice_id = invoice_id
        @opts = opts
      end

      ##
      # Calls the gateway
      #
      # @return [TrueClass]
      def call
        Billomat::Gateway.new(:put, path, wrapped_data).run

        true
      end

      ##
      # The given options have to be wrapped
      #
      # @return [Hash] The payload for the complete request
      def wrapped_data
        { complete: @opts }
      end

      # @return [String] The complete path with the invoice_id
      def path
        "/invoices/#{@invoice_id}/complete"
      end
    end
  end
end
