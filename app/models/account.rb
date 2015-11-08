class Account < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :timeoutable, :trackable, :validatable

  has_many :expenses, dependent: :destroy 
  has_many :incomes, dependent: :destroy 
  has_many :income_payments, dependent: :destroy 

  include Gravtastic
  gravtastic
end
