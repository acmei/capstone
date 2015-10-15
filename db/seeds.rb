require 'csv'

CSV.foreach("db/therapists.csv", headers: true, header_converters: :symbol, converters: :all) do |row|  
  Therapist.create(
    name: row[:name],
    email: row[:email],
    phone: row[:phone],
    password: row[:password],
    password_confirmation: row[:password]
    )
end

CSV.foreach("db/users.csv", headers: true, header_converters: :symbol, converters: :all) do |row|
  User.create(
    username: row[:username],
    email: row[:email],
    password: row[:password],
    password_confirmation: row[:password],
    therapist_id: row[:therapist_id]
    )
end

CSV.foreach("db/contacts.csv", headers: true, header_converters: :symbol, converters: :all) do |row|
  Contact.create(
    name: row[:name],
    phone: row[:phone],
    user_id: row[:user_id]
    )
end
