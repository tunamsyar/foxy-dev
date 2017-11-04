class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :transactions
  has_many :international_top_ups
  has_many :reloads
  has_many :operator_pins
  has_one :wallet
  after_create :create_wallet

  def create_wallet
    WalletServices.new(self).init_wallet
  end

  def total_today
    transactions.where(
      'created_at BETWEEN ? AND ?',
      DateTime.now.beginning_of_day,
      DateTime.now.end_of_day).map(&:amount).sum.to_s
  end
end
