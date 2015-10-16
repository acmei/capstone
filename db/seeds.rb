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

CSV.foreach("db/diaries.csv", headers: true, header_converters: :symbol, converters: :all) do |row|
  Diary.create(
    filled_in_session: row[:filled_in_session],
    times_filled: row[:times_filled],
    user_id: row[:user_id]
    )
end
