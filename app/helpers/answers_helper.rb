module AnswersHelper
  def select(num)
    (0..num).map{ |n| [n, n] }
  end
end
