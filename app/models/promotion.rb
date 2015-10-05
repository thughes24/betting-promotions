class Promotion < ActiveRecord::Base
  belongs_to :agent
  default_scope do order("created_at DESC") end
  def self.search(promo = nil)
    return [] if promo.blank?
    Promotion.where("lower(info) like ? OR lower(title) like ?", "%#{promo.downcase}%", "%#{promo.downcase}%")
  end

  def time_since_posted
    time_posted = created_at.to_i
    current_time = Time.now.to_i
    difference = current_time - time_posted
    if difference < 86400
      "Today"
    else
      "#{difference/86400}d Ago"
    end
  end
end