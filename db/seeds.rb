require 'csv'

# THERAPISTS
CSV.foreach("db/therapists.csv", headers: true, header_converters: :symbol, converters: :all) do |row|  
  Therapist.create(
    name: row[:name],
    email: row[:email],
    phone: row[:phone],
    password: row[:password],
    password_confirmation: row[:password]
    )
end

# USERS
CSV.foreach("db/users.csv", headers: true, header_converters: :symbol, converters: :all) do |row|
  User.create(
    username: row[:username],
    email: row[:email],
    password: row[:password],
    password_confirmation: row[:password],
    therapist_id: row[:therapist_id]
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

# DIARIES
CSV.foreach("db/diaries.csv", headers: true, header_converters: :symbol, converters: :all) do |row|
  Diary.create(
    filled_in_session: row[:filled_in_session],
    times_filled: row[:times_filled],
    user_id: row[:user_id]
    )
end

# QUESTIONS
CSV.foreach("db/questions.csv", headers: true, header_converters: :symbol, converters: :all) do |row|
  Question.create(
    text: row[:text],
    category: row[:category],
    answer_type: row[:answer_type]
    )
end

# DIARIES_QUESTIONS JOIN TABLE
question_ids = (1..19).to_a
diary_ids = (1..12).to_a
diaries_questions = {}

diary_ids.each do |id|
  diaries_questions[id] = question_ids
end

diaries_questions.each do |i, r|
  diary = Diary.find(i)
  r.each do |x|
    diary.questions << Question.find(x)
  end
end

# ANSWERS
CSV.foreach("db/answers.csv", headers: true, header_converters: :symbol, converters: :all) do |row|
  Answer.create(
    num_val: row[:num_val],
    text_val: row[:text_val],
    bool_val: row[:bool_val],
    question_id: row[:question_id],
    user_id: row[:user_id]
    )
end
