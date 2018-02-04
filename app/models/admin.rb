class Admin < ApplicationRecord
  acts_as_paranoid sentinel_value: '1000-01-01'
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
    :registerable,
    :recoverable,
    :rememberable,
    :trackable,
    :validatable,
    :lockable,
    :timeoutable

  validates :last_name, presence: false, length: { maximum: 30 }
  validates :first_name, presence: false, length: { maximum: 30 }
  validates :last_kana, presence: false, length: { maximum: 30 }
  validates :first_kana, presence: false, length: { maximum: 30 }
  validates :nickname, presence: true, length: { maximum: 30 }

  def name
    "#{last_name} #{first_name}"
  end

  def kana
    "#{last_kana} #{first_kana}"
  end
end
