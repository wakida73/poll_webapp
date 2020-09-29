class Poll < ApplicationRecord
  has_many :lists ,dependent: :destroy#, inverse_of: :poll
  has_many :poll_users ,dependent: :destroy
  has_many :users, through: :poll_users
  accepts_nested_attributes_for :lists, allow_destroy: true
  accepts_nested_attributes_for :users, allow_destroy: true

  validates :title, presence: true,length: { in: 1..50 } 
  validates :started_at, presence: true
  validates :ended_at, presence: true
  # validate :start_end_check

  # def start_end_check
  #   errors.add(:ended_at, "の日付を正しく記入してください。") unless
  #   self.started_at < self.ended_at
  # end
  validate :start_check
  validate :before_check

  def start_check
    if started_at.present? && started_at < DateTime.now
      errors.add(:started_at, ": 過去の日付は使用できません")
    end
  end
  
  def before_check
    if ended_at.present? && ended_at < started_at
      errors.add(:ended_at, ": 開始時間より過去の日付は使用できません")
    end
  end


end
