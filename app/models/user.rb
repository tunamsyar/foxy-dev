class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :phone_number,
            presence: true,
            length: { maximum: 10 }

  has_many :transactions
  has_many :international_top_ups
  has_many :reloads
  has_many :operator_pins
  has_one :wallet
  after_create :create_wallet

  rails_admin do
    field :id
    field :name
    field :email
    field :phone_number
    field :created_at
  end

  def create_wallet
    WalletServices.new(self).init_wallet
  end

  def total_top_up_today
    transactions.where(
      'created_at BETWEEN ? AND ?',
      DateTime.now.beginning_of_day,
      DateTime.now.end_of_day).map(&:amount).sum
  end

  def total_pin_today
    operator_pins.where(
      'created_at BETWEEN ? AND ?',
      DateTime.now.beginning_of_day,
      DateTime.now.end_of_day).map(&:amount).sum
  end

  def total_international_today
    international_top_ups.where('created_at BETWEEN ? AND ?',
      DateTime.now.beginning_of_day,
      DateTime.now.end_of_day).map(&:amount).sum
  end

  def total_today
    total_top_up_today + total_pin_today + total_international_today
  end
end
