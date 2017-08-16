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
end
