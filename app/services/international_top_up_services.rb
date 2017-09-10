require 'httparty'

class InternationalTopUpServices
  include HTTParty
  format :xml
  base_uri 'http://testapi.mobilepulsa.com'

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
    top_up
    # check_status
  end

  def refund_wallet
    @total = @wallet.balance.to_i + @transaction.amount.to_i
    @wallet.update_attributes(balance: @total)
  end
  
  def respond_to_mobipulsa
    @response = self.class.post('/receiver', :body => @body)
    #if response on
  end

  private
  
  def top_up
    @top_up=  {
                :commands => "topup",
                :username => "neraca",
                :ref_id => @trx.ref_id,
                :hp => @trx.phone_number,
                :pulsa_code => @trx.operator.operator_rate.code,
                :sign => @encrypt
              }
    @body = @test.to_xml(:root => 'mp', :skip_instruct => true)
    respond_to_mobipulsa
  end
  
  def encrypt
    @encrypt = Digest::MD5.hexdigest("neraca"+"password"+@trx.ref_id)
  end
  
end
