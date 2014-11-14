class PrintJob < ActiveRecord::Base
  belongs_to :project

  def cost
    (quantity && rate) ? quantity * rate : 0
  end

  def total_rewards
    (cost && rewards_percentage) ? cost * rewards_percentage * 0.01 : 0
  end

end
