module ReservationModules
  module InstanceMethods
    def duration
      self.checkout - self.checkin
    end
    def total_price
      price = self.listing.price
      price * duration
    end
  end
end

module ReservationModule
  module InstanceMethods
    def duration
      self.checkout - self.checkin
    end
    def total_price
      price = self.listing.price
      price * duration
  end
end

class ValidateGuestReservation < ActiveModel::Validator
  def validate(record)
    if record.guest == record.listing.host
      record.errors[:host] << 'host cannot be customer'
    end
  end
end

<<<<<<< HEAD
class ValidateDates < ActiveModel::Validator
  def validate(record)
    unless record.checkout > record.checkin
      record.errors[:guest] << 'checkout must be > checkin'
    end
  end
<<<<<<< HEAD
end
=======
end

# class ListingCheckinAvailability < ActiveModel::Validator
#   def validate(record)
#     checkin_dates = []
#     record.listing.reservations.each do |reservation|
#       checkin_dates << reservation.checkin
#     end
#     unless checkin_dates.include?(record.checkin)
#       record.errors[:checkin] << 'checkin not available'
#     end
#   end
# end
=======
# class ListingCheckinAvailability < ActiveModel::Validator
#   def validate(record)
#     checkin_dates = []
#     record.listing.reservations.each { |reservation|
#       checkin_dates << reservation.checkin
#     }
#     unless checkin_dates.include?(record.checkin)
#       record.errors[:checkin] << 'checkin not available'
#     end
#   end
# end

class CheckDateValidity < ActiveModel::Validator
  
  def validate(record)
    unless record.checkout > record.checkin
      record.errors[:host] << "checkout must be > checkin"
    end
  end
  
end
>>>>>>> 33f0140444d36c3d9f5a9696c66077e7437aefc9
>>>>>>> ef8da108760951a05342b99d88314e99bfdc58de
