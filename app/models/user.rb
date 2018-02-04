class User < ApplicationRecord
  acts_as_paranoid sentinel_value: '1000-01-01'
  enum gender: { male: 1, female: 2, other: 9 }

  validates :last_name, presence: false, length: { maximum: 30 }
  validates :first_name, presence: false, length: { maximum: 30 }
  validates :last_kana, presence: false, length: { maximum: 30 }
  validates :first_kana, presence: false, length: { maximum: 30 }
  validates :postcode, presence: false
  validates :postcode, format: { with: /\A\d{3}-?\d{4}\z/ }, allow_blank: true
  validates :prefecture, presence: false, length: { maximum: 4 }
  validates :city, presence: false, length: { maximum: 60 }
  validates :address, presence: false, length: { maximum: 100 }
  validates :tel, presence: false
  validates :tel, format: { with: /\A\d{1,5}-?\d{1,5}-?\d{1,5}\z/ }, length: { maximum: 13 }, allow_blank: true
  validates :nickname, presence: true, length: { maximum: 30 }
  validates :gender, presence: true, inclusion: { in: User.genders.keys }

  def name
    "#{last_name} #{first_name}"
  end

  def kana
    "#{last_kana} #{first_kana}"
  end
end
