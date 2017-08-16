require 'httparty'

class InternationalTopUpServices
  include HTTParty
  format :xml
  base_uri 'testapi.mobilepulsa.com'

  def initialize(transaction)
    @trx = transaction
    @wallet = Wallet.find_by(user_id: transaction.user_id)
    @test= {
            :commands => "pricelist", 
            :username => "neraca", 
            :sign =>  "77b5710edf2c7fe02b18d69541a73a0e"
          }
    @body = @test.to_xml(:root => 'mp', :skip_instruct => true)
  end

  def deduct_wallet
    @total = @wallet.balance.to_i - @transaction.amount.to_i
    @wallet.update_attributes(balance: @total)
    # check_status
  end

  def refund_wallet
    @total = @wallet.balance.to_i + @transaction.amount.to_i
    @wallet.update_attributes(balance: @total)
  end
  
  def respond_to_mobipulsa
    self.class.post('/receiver', :body => @body)
  end

  private
  
  # def encrypt
  #   Digest::MD5.hexdigest(username+password+id)
  # end
end