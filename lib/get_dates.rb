def get_dates
  @dates_array = []

  @bookings.each do |booking|
    @dates_array << booking.check_in
    check_in = Date.parse(booking.check_in)
    check_out = Date.parse(booking.check_out)

    stay = (check_out - check_in).to_i

    i = stay - 1
    date = check_in


    i.times do
      date += 1
      @dates_array << date.strftime("%d-%m-%Y")
    end


  end
end
