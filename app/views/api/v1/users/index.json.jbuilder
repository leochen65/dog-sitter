  # json.users @users, :id, :first_name, :last_name, :address, :bio, :gender, :age, :language, :phone_number, :price, :created_at, :updated_at, :open_id, :image_url, :dogs, :services

json.users @users do |user|
  json.id user.id
  json.first_name user.first_name
  json.last_name user.last_name
  json.gender user.gender
  json.address user.address
  json.bio user.bio
  json.language user.language
  json.image_url user.image_url
  json.phone_number user.phone_number
  json.price user.price
  json.latitude user.latitude
  json.longitude user.longitude

  json.dogs user.dogs do |dog|
    json.breed dog.breed
    json.name dog.name
    json.gender dog.gender
    json.age dog.age
    json.medical_history dog.medical_history
  end

  json.services user.services do |service|
    json.categories service.categories
    json.duration service.duration
    json.bookings service.bookings do |booking|
      json.start_date booking.start_date.strftime("%A, %b, %d")
      json.end_date booking.end_date.strftime("%A, %b, %d")
      json.reviews booking.reviews do |review|
        json.content review.content
        json.rating review.rating
      end
    end
    end
end
