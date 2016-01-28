class Cat < ActiveRecord::Base

  validates :name, presence: true
  validates :sex, presence: true, inclusion: { in: ["M","F"] }
  validates :description, presence: true
  CAT_COLOR = %w(red orange yellow green blue indigo violet rainbow)
  validates :color, inclusion: CAT_COLOR, if: "self.color"

  has_many :cat_rental_requests,
  class_name: "CatRentalRequest",
  foreign_key: :cat_id,
  primary_key: :id

  def age
    now_time = Time.now.strftime("%y")
    cat = self.birth_date

    now_time.year - cat.year

  end
end
