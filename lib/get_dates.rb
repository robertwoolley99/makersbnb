def get_dates
  @dates_array = []

  @bookings.each do |booking|
    @dates_array << booking.check_in
    @dates_array << booking.check_out
  end

end
