def get_dates
  @dates_array = []

  @bookings.each do |booking|
    @dates_array << booking.check_in

    # date_out_modified = Date.parse(booking.check_out)
    #
    # date_out_modified -= 1
    #
    # date_out_modified_string = date_out_modified.strftime("%d-%m-%Y")
    #
    # @dates_array << date_out_modified_string
    check_in = Date.parse(booking.check_in)
    check_out = Date.parse(booking.check_out)

    stay = (check_out - check_in).to_i

    i = stay - 1
    date = check_in
    i.times do
      date += 1
      @dates_array << date.strftime("%d-%m-%Y")
    end

    # i = 1
    # unless stay > 1
    #   until i = (stay - 2)
    #     pad_date = check_in + i
    #     date_to_push = pad_date.strftime("%d-%m-%Y")
    #     @dates_array << date_to_push
    #     i += 1
    #   end
    # end





  end

end
