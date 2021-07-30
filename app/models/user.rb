class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
    validates :password, format: {with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i}

  with_options presence: true do
    validates :nickname
    validates :birth_day

    with_options format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/} do
      validates :first_name
      validates :family_name
    end
 
    with_options format: {with: /\A[ァ-ヶー－]+\z/} do
      validates :first_name_kana
      validates :family_name_kana
    end
  end
end
