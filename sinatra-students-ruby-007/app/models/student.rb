class Student < ActiveRecord::Base

  before_save :slugify!

  def slugify!
    self.slug = self.name.downcase.gsub(" ","-")
  end

  def profile_img_link
    if self.profile_image != nil
      "http://ruby007.students.flatironschool.com" + self.profile_image.gsub('..','')
    end
  end

  def background_img_link
    if self.background_image != nil
      "http://ruby007.students.flatironschool.com" + self.background_image.gsub('..','')
    end
  end

  def escape_quotes
    self.quote.gsub(/'/, "&#39;") if self.quote
  end

end