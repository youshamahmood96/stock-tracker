class Stock < ApplicationRecord
    def self.new_lookup(ticker_symbol)
        client = IEX::Api::Client.new(
            publishable_token: Rails.application.credentials.iex_client[:sandbox_api_key],
            secret_token: 'Tpk_fcdb52dda2654f9a821c43990487458a',
            endpoint: 'https://sandbox.iexapis.com/v1'
        )
        client.price(ticker_symbol)
    end 
end
