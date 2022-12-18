module ReservationsHelper
  def logged_in?
    !current_user.nil?
  end
end
