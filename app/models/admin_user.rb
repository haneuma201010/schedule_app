class AdminUser < ApplicationRecord
  # attr_accessor :remember_token
  validates :name,  presence: true, length: { maximum: 50 }
  # validates(:name, {presence: true, length: { maximum:50 }})←省略無しで書くとこうなる？？(多分)
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
                    
    # class << self
    #   # 渡された文字列のハッシュ値を返す
    #   def AdminUser.digest(string)
    #     cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
    #                                                   BCrypt::Engine.cost
    #     BCrypt::Password.create(string, cost: cost)
    #   end
  
    #   # ランダムなトークンを返す
    #   def new_token
    #     SecureRandom.urlsafe_base64
    #   end
    # end
      # 渡された文字列のハッシュ値を返す
  def AdminUser.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
    
  # # 永続セッションのためにユーザーをデータベースに記憶する
  # def remember
  #   self.remember_token = AdminUser.new_token # AdminUser.remember_token = AdminUser.new_token #正しいかわからない　#要確認
  #   update_attribute(:remember_digest, AdminUser.digest(remember_token))
  # end
  
  # def authenticated?(remember_token)
  #   return false if remember_digest.nil?
  #   BCrypt::Password.new(remember_digest).is_password?(remember_token) # 渡されたトークンがダイジェストと一致したらtrueを返す
  # end

  
  # # ユーザーのログイン情報を破棄する
  # def forget
  #   update_attribute(:remember_digest, nil)
  # end
end
