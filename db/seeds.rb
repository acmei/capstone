require 'csv'

# generate random datetime
def time_rand from = Time.new(2015, 10, 15), to = Time.now
  Time.at(from + rand * (to.to_f - from.to_f))  
end 

# PHOTOS
CSV.foreach("db/photos.csv", headers: true, header_converters: :symbol, converters: :all) do |row|
  Photo.create(
    link: row[:link]
    )
end

# USERS
CSV.foreach("db/users.csv", headers: true, header_converters: :symbol, converters: :all) do |row|
  User.create(
    name: row[:name],
    email: row[:email],
    phone: row[:phone],
    password: row[:password],
    password_confirmation: row[:password],
    activated: row[:activated],
    activated_at: Time.zone.now,
    therapist_id: row[:therapist_id],
    photo_id: row[:photo_id]
    )
end

# CONTACTS
CSV.foreach("db/contacts.csv", headers: true, header_converters: :symbol, converters: :all) do |row|
  Contact.create(
    name: row[:name],
    phone: row[:phone],
    user_id: row[:user_id]
    )
end

# QUESTIONS
CSV.foreach("db/questions.csv", headers: true, header_converters: :symbol, converters: :all) do |row|
  Question.create(
    text: row[:text],
    category: row[:category],
    answer_type: row[:answer_type],
    recurrence: row[:recurrence]
    )
end

# QUESTIONS_USERS JOIN TABLE
question_ids = (1..19).to_a
user_ids = (1..4).to_a
questions_users = {}

user_ids.each do |id|
  questions_users[id] = question_ids
end

questions_users.each do |i, r|
  user = User.find(i)
  r.each do |x|
    user.questions << Question.find(x)
  end
end

# ANSWERS
CSV.foreach("db/answers.csv", headers: true, header_converters: :symbol, converters: :all) do |row|
  Answer.create(
    date: time_rand,
    num: row[:num],
    text: row[:text],
    bool: row[:bool],
    question_id: row[:question_id],
    user_id: row[:user_id]
    )
end

# SKILLS
CSV.foreach("db/skills.csv", headers:true, header_converters: :symbol, converters: :all) do |row|
  Skill.create(
    text: row[:text],
    category: row[:category],
    acronym: row[:acronym],
    description: row[:description]
    )
end
