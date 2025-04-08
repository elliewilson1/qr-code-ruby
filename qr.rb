# Write your solution here!
# pp "hello world"

require "rqrcode"
require "dotenv/load"

# Ask the user what kind of QRCode they want to make
puts "What kind of QR code would you like to generate?"
puts
puts "1. Open a URL"
puts "2. Join a wifi network"
puts "3. Send a text message"
puts
puts "Press 4 to exit"
puts
user_selection = gets.chomp
if user_selection == "1"
  puts
  puts "What is the URL you would like to encode?"
  puts
  user_link = gets.chomp
  puts
  puts "What would you like to call the PNG?"
  puts
  png_name = gets.chomp
  # Use the RQRCode::QRCode class to encode a hyperlink
  qrcode = RQRCode::QRCode.new(user_link)
  # Use the .as_png method to create a 500 pixels by 500 pixels image
  png = qrcode.as_png({ :size => 500 })
  # Write the image data to a file
  IO.binwrite(png_name + ".png", png.to_s)
elsif user_selection == "2"
  puts
  puts "What is the name of the wifi network?"
  puts
  wifi_network = gets.chomp
  puts
  puts "What is the password?"
  puts
  wifi_password = gets.chomp
  puts
  puts "What would you like to call the PNG?"
  puts
  png_name = gets.chomp
  # Use the RQRCode::QRCode class to encode a wifi password
  qrcode = RQRCode::QRCode.new("WIFI:T:WPA;S:" + wifi_network + ";P:" + wifi_password + ";;")
  # Use the .as_png method to create a 500 pixels by 500 pixels image
  png = qrcode.as_png({ :size => 500 })
  # Write the image data to a file
  IO.binwrite(png_name + ".png", png.to_s)
elsif user_selection == "3"
  puts
  puts "What is the phone number you want the code to send a text message to?"
  puts
  sms_number = gets.chomp
  puts
  puts "What do you want to populate the message with?"
    puts
  message = gets.chomp
  puts
  puts "What would you like to call the PNG?"
  puts
  png_name = gets.chomp
  # Use the RQRCode::QRCode class to encode a phone number and text message
  qrcode = RQRCode::QRCode.new("SMSTO:" + sms_number + ": " + message)
  # Use the .as_png method to create a 500 pixels by 500 pixels image
  png = qrcode.as_png({ :size => 500 })
  # Write the image data to a file
  IO.binwrite(png_name + ".png", png.to_s)
elsif user_selection == "4"
  puts
  puts "Goodbye!"
else 
end
