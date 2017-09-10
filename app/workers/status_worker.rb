class StatusWorker
  include Sidekiq::Worker
  include HTTParty
  
  def perform(status, transaction)
    @top_up_status = HTTParty.get(status)
    @transaction = Transaction.find_by(id: transaction)
    @transaction.success! if @top_up_status.code == 200    
    #   #204(pending),403(failed)
    # else
    #   #something here
    # end
  end
end