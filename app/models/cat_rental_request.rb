class CatRentalRequest < ActiveRecord::Base
    STATUS = ["PENDING", "APPROVED", "DENIED"]
    validates :status, inclusion: STATUS

    belongs_to :cat,
    class_name: "Cat",
    foreign_key: :cat_id,
    primary_key: :id

    def overlapping_requests

    end

    def overlapping_approved_requests

    end
end
