class Project < ActiveRecord::Base
  has_many :languages
  has_many :tags
  belongs_to :user


  def recent?
    if self.pushed_at
      num_of_days = Date.today - Date.parse("#{self.pushed_at}")
      true if num_of_days.to_i < 60
    end

  end 



  # def heart_class(user)
  #   if user_liked?(user)
  #     "glyphicon glyphicon-heart red-heart"
  #   else
  #     "glyphicon glyphicon-heart grey-heart"
  #   end
  # end

end
