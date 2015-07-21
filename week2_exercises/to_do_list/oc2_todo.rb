# OC2. The Sinatra TODO

# In the good old days, programming a basic blog was the "Hello World!" for the web. Now it seems to be writing a TODO list,
# as if we wanted to overthrone Evernote for that. So let's be hipsters about it, and do the job!

# Let's use Sinatra for that! Write a small application that allows us to:

# - Add tasks to a list
# - Clicking over a task should mark it as done
# - Once done we should be able to delete a task
# - The date of creation should be shown together with the task
# - If the task contains the word urgent the task will become the most prioritary
# - The task list should be saved in a file so we can restart the application and the tasks should persist.


require 'sinatra'
require 'sinatra/reloader'
require 'rubygems'
require 'active_record'

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: 'oc2_todo.sqlite'
)

set :port, 3009
set :bind, '0.0.0.0'
 
class Task < ActiveRecord::Base

	validates_presence_of :name, :date

end

get ('/') do
	#@tasks = Task.delete_all
	@tasks = Task.all
	erb :oc2_todo
end

post ('/task/new') do
	task = Task.new(params)
	task.save
	#tasks << params[:name]
	redirect ('/')
end




__END__

  <ul>
        <% @tasks.each do |task| %>
          <% @tasks.each
          <li> <a href> <%= task %> </a> </li> <!-- #delete when clicked -->
          
        <% end %>
      </ul>


