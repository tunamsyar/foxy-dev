class InternationalTopUpServices
  include HTTParty
  format :xml
  base_uri 'http://testapi.mobilepulsa.com'

  def initialize(transaction)
    @trx = transaction
    @wallet = Wallet.find_by(user_id: transaction.user_id)
    @operator = Operator.find_by(operator_id: transaction.operator_id)
                        .operator_name
  end

  def deduct_wallet
    @total = @wallet.balance.to_i - @trx.amount.to_i
    @wallet.update_attributes(balance: @total)
    top_up
    # check_status
  end

  def refund_wallet
    @total = @wallet.balance.to_i + @transaction.amount.to_i
    @wallet.update_attributes(balance: @total)
  end
  
  def respond_to_mobipulsa
    @response = HTTParty.post('/receiver', :body => @body)
    #if response on
  end
  
  def top_up
    @top_up=  {
                :commands => "topup",
                :username => ENVied.PULSA_USERNAME,
                :ref_id => @trx.ref_id,
                :hp => @trx.phone_number,
                :pulsa_code => @trx.operator.operator_rate.code,
                :sign => @encrypt
              }
    @body = @test.to_xml(:root => 'mp', :skip_instruct => true)
    respond_to_mobipulsa
  end
  
  def encrypt
    @encrypt = Digest::MD5.hexdigest(
                            ENVied.PULSA_USERNAME+ENVied.API_DEV_KEY+@trx.ref_id
                          )
  end
  
end
