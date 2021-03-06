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

  scope :male, -> { where(gender: self.genders[:male]) }
  scope :female, -> { where(gender: self.genders[:female]) }

  def user_no_f
    "%04d-%04d" % [(user_no/10000), (user_no%10000) ]
  end

  def name
    "#{last_name} #{first_name}"
  end

  def kana
    "#{last_kana} #{first_kana}"
  end

  def postcode_f
    "#{postcode[0,3]}-#{postcode[3,4]}"
  end

  def full_address
    "#{prefecture}#{city}#{address}"
  end

  def age
    date_format = "%Y%m%d"
    (Date.today.strftime(date_format).to_i - birthday.strftime(date_format).to_i) / 10000
  end
end
