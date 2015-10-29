module QuestionsHelper
  def categories
    [
      ['Urge', 'urge'],
      ['Highest Rating', 'rating'],
      ['Drugs & Medications', 'med'],
      ['Action', 'action'],
      ['Emotion', 'emotion'],
      ['Optional', 'optional'],
      ['Coming to Session: Urge', 'session_urge'],
      ['Coming to Session: Belief I can Change/Regulate', 'session_reg']
    ]
  end

  def answer_types
    [
      ['Number', 'num'],
      ['Text', 'text'],
      ['Number and Text', 'num/text'],
      ['Yes or No', 'bool']
    ]
  end

  def recurrence
    [
      ['Daily', 7],
      ['Weekly', 1]
    ]
  end
end
