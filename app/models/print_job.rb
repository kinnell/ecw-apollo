class PrintJob < ActiveRecord::Base
  belongs_to :project

  def cost
    quantity ||= 0
    rate ||= 0
    quantity * rate
  end

  def total_rewards
    rewards_percentage ||= 0
    cost * rewards_percentage
  end

end
