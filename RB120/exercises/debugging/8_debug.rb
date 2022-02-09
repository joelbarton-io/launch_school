require 'pry'
=begin
Valentina is using a new task manager program she wrote. When interacting with her task manager,
an error is raised that surprises her. Can you find the bug and fix it?
=end

class TaskManager
  attr_reader :owner
  attr_accessor :tasks

  def initialize(owner)
    @owner = owner
    @tasks = []
  end

  def add_task(name, priority=:normal)
    task = Task.new(name, priority)
    tasks.push(task)
  end

  def complete_task(task_name)
    completed_task = nil

    tasks.each do |task|
      completed_task = task if task.name == task_name
    end

    if completed_task
      tasks.delete(completed_task)
      puts "Task '#{completed_task.name}' complete! Removed from list."
    else
      puts "Task not found."
    end
  end

  def display_all_tasks
    display(tasks)
  end

  def display_high_priority_tasks
    #binding.pry
    tasks = self.tasks.select do |task|
      task.priority == :high
    end

    display(tasks)
  end

  private

  def display(tasks)
    puts "--------"
    tasks.each do |task|
      puts task
    end
    puts "--------"
  end
end

class Task
  attr_accessor :name, :priority

  def initialize(name, priority=:normal)
    @name = name
    @priority = priority
  end

  def to_s
    "[" + sprintf("%-6s", priority) + "] #{name}"
  end
end

valentinas_tasks = TaskManager.new('Valentina')

valentinas_tasks.add_task('pay bills', :high)
valentinas_tasks.add_task('read OOP book')
valentinas_tasks.add_task('practice Ruby')
valentinas_tasks.add_task('run 5k', :low)

valentinas_tasks.complete_task('read OOP book')

valentinas_tasks.display_all_tasks
valentinas_tasks.display_high_priority_tasks
=begin
Within the display_high_priority_tasks instance method, where we think we are calling the tasks setter
method and reassigning the instance variable @task to the return value of the select invocation
(an array containing a single Task object), ruby actually thinks we are initializing a new local variable
tasks. Thus when we invoke select on task (currently an uninitialized local variable), we get
NoMethodError exception thrown since uninitialized local variables always reference nil (whose class
doesn't include a select method). We could sort this out in a couple of ways, most of which have already
been covered by other students.

This bug highlights the importance of using self when calling setter methods (i.e. attr_writer) to
distinguish them from just initializing a local variable. It's also an example of when ruby's syntactic
sugar can get us in trouble.
=end