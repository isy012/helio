# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

Isbn =
  cleanNumber: (number) -> number.replace /[- ]/g, ""
  
  validNumber: (number) ->
    total = 0
    number = @cleanNumber(number)
    for i in [(number.length-1)..0]
      n = +number[i]
      if (i+number.length) % 2 == 0
        n = if n*2 > 9 then n*2 - 9 else n*2
      total += n
    total % 10 == 0


jQuery ->
  $("#book_isbn10").blur ->
    if Isbn.validNumber(@value)
      $("#credit_card_number_error").text("Valid ISBN")
    else
      $("#credit_card_number_error").text("Invalid ISBN")