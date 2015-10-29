module AnswersHelper
  def num_select(num)
    (0..num).map{ |n| [n, n] }
  end
end
