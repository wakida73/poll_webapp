class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :group_users, dependent: :destroy
  has_many :groups, through: :group_users
  has_many :poll_users,dependent: :destroy
  has_many :polls, through: :poll_users

  accepts_nested_attributes_for :group_users,allow_destroy: true
  accepts_nested_attributes_for :poll_users,allow_destroy: true


  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable,
        :confirmable, :lockable, :timeoutable


end
