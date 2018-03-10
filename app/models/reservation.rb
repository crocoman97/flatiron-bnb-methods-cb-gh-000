
require_relative './concerns/reserve_module.rb'

class Reservation < ActiveRecord::Base

  include ActiveModel::Validations
<<<<<<< HEAD
  include ReservationModules::InstanceMethods

=======
  include ReservationModule::InstanceMethods
  
>>>>>>> 33f0140444d36c3d9f5a9696c66077e7437aefc9
  belongs_to :listing
  belongs_to :guest, :class_name => "User"
  has_one :review

  validates :checkin, :checkout, presence: true
  validates_with ValidateGuestReservation
<<<<<<< HEAD
  validates_with ValidateDates
  validate :available
  
  private

<<<<<<< HEAD
  def available
    Reservation.where(listing_id: listing.id).where.not(id: id).each do |r|
      booked_dates = r.check_in..r.check_out
      if booked_dates === check_in || booked_dates === check_out
        errors.add(:guest_id, "Sorry, this place isn't available during your requested dates.")
      end
    end
  end
  
=======
=======
  validates_with CheckDateValidity
  
>>>>>>> 33f0140444d36c3d9f5a9696c66077e7437aefc9
>>>>>>> ef8da108760951a05342b99d88314e99bfdc58de
end
