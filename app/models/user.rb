class User < ApplicationRecord
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    attr_accessor :login

    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :validatable
      has_many :projects, dependent: :destroy 
      has_one_attached :avatar
   

    
  def self.find_for_database_authentication warden_condition
    conditions = warden_condition.dup
    login = conditions.delete(:login)
    where(conditions).where(
      ["lower(username) = :value OR lower(email) = :value",
      { value: login.strip.downcase}]).first
  end

  end
  