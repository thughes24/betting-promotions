class Promotion < ActiveRecord::Base
  belongs_to :agent
  validates_uniqueness_of :title, :scope => :agent_id

  def self.search(promo = nil)
    return [] if promo.blank?
    Promotion.where("info like ? OR title like ?", "%#{promo}%", "%#{promo}%")
  end
end