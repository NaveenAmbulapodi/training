class Student < ApplicationRecord
    # validates :name, presence: true
      # validates :name, exclusion: { in: %w(kishore venkat), message: "%{value} is
      # reserved." }
      # validates :name, inclusion: { in: %w(kishore venkat), message: "%{value} is not in
        # the included list." }
       validates :name, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
       
      # validates :marks, numericality: true
       #validates :name, uniqueness: true
#
      #validates :name, uniqueness: { scope: :marks, message: "should happen once
      #per year" }
      # validates :name, uniqueness: { case_sensitive: false }

  # validate :name_and_subject 
  #  validates :name, presence: true, if: :check_subject_presence?
    
 # validates :marks, presence: true, unless: Proc.new{ |a| a.subject.blank?}

#   after_initialize do
#     puts "\n calling after intialize callback \n"
#   end
  ## or ##

  # after_initialize :method_after_init
  # after_find :method_after_find
  # after_find :method_after_find, if: :check_the_condition?
  # after_touch :method_after_touch 
  #  before_save :method_before_save
  # after_save :method_after_save
  #    around_save :method_around_save
  #    after_destroy :method_after_destroy
  #    after_commit :method_after_commit, on: [:create]
  #    after_rollback :method_after_rollback

  ## scopes ##
  # scope :matching, ->(q) { where(name: q)}




private

  def check_the_condition?
    true
  end
  def method_after_touch 
    puts "\n calling after touch callback \n"
  end
  def method_before_save
    puts "\n calling before save callback"
  end
  def method_after_save
    puts "\n calling after save callback \n"
  end
  def method_around_save 
    puts "\n calling before save callback \n"
    yield
    puts "\n calling after save callback \n"
  end
  def method_after_destroy 
    puts "\n calling after delete callback \n"
  end
def method_after_init
    puts "\n calling after intialize callback1 \n"

end
def method_after_find
    puts "\n calling after find callback\n"
end
def method_after_commit
    puts "\n calling after commit callback \n"
  end
  def method_after_rollback 
    puts "\n calling after rollback callback \n"
  end
  

    def check_subject_presence?
        subject == "ruby"
    end

      def name_and_subject
      if name.blank? && subject.blank?
        errors.add(:base, "name and subject cant be blank ")
      end
    end
    has_one_attached :main_image
end
