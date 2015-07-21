# OC1. IronhackLIST

# Oh, man. We are so proud of our Student class. Validated, short, compact. Is it love?

# # Anyway, the thing you probably missed from SL7 is having some web in between. Some routes, 
# some Sinatra, some ERB… so let’s do it, why
# # not?

# # You will now implement a Ironhack directory of students, that shows a list of everyone’s name, 
# surname, birthday, a clickable link to
# # their website, if they have programming experience or not (Yes/No) and, more importantly, 
# ¡the number of dogs they have!

# # Apart from that, you should be able to create new students through the interface, and also
#  delete the ones which have 0 dogs (we cannot
# # kick the others out, they have dogs!).

# Go for it!
require 'sinatra'
require 'sinatra/reloader'
require 'rubygems'
require 'active_record'

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: 'oc1_ironhack_list.sqlite'
)

set :port, 3010
set :bind, '0.0.0.0'

class Student < ActiveRecord::Base
  # we have name, surnames, birthday, website, number_of_dogs
  # and first_programming_experience

  AGE_MINIMUM = 16

  validates_presence_of :name, :surnames
  # validates_format_of :website, with: /\Ahttp:/
  # validates_numericality_of :number_of_dogs, greater_than: 0
  # validate :name_presence
  # validate :proper_age
  # validate :not_before_1970_with_more_than_a_dog
  # validate :not_llorenç_or_sharon

  def complete_name
    [name, surnames].join(' ')
  end

end

get ('/') do
	#@students = Student.delete_all
	@students = Student.all
	erb :oc1_ironhack_list
end

post ('/student/new') do
	student = Student.new(params)
	student.save
	redirect ('/')
end




__END__


  def complete_name
    [name, surnames].join(' ')
  end
  # private

  # def name_presence
  #   unless name.present?
  #     errors.add(:name, 'must be present')
  #   end
  # end

  # def proper_age
  #   unless birthday < AGE_MINIMUM.years.ago
  #     errors.add(:birthday, 'is too young')
  #   end
  # end

  # def not_before_1970_with_more_than_a_dog
  #   if birthday < Date.new(1970) && number_of_dogs > 1
  #     errors.add(:birthday, 'cannot be before 1970 and have >1 dogs')
  #   end
  # end

  # def not_llorenç_or_sharon
  #   ["Llorenç", "Sharon"]
  #   if %w{ Llorenç Sharon }.include?(name)
  #     errors.add(:name, "cannot be #{name}")
  #   end
  # end

