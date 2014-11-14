class PrintJob < ActiveRecord::Base
  belongs_to :project

  def total_rewards
    (total_quote && rewards_percentage) ? total_quote * rewards_percentage * 0.01 : 0
  end

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |product|
        csv << product.attributes.values_at(*column_names)
      end
    end
  end

end
