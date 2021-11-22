class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  def add(todo)
    if Todo === todo
      todos << todo
    else
      raise TypeError.new("Can only add Todo objects")
    end
  end
  alias_method :<<, :add

  def size
    todos.size
  end

  def first
    todos[0]
  end

  def last
    todos[-1]
  end

  def to_a
    todos
  end

  def done?
    todos.select { |items| items.done }
  end

  def item_at(num)
    todos.fetch(num)
  end

  def mark_done_at(index)
    item_at(index).done!
  end

  def mark_undone_at(index)
    item_at(index).undone!
  end

  def done!
    todos.each(&:done!)
  end

  def shift
    todos.shift
  end

  def pop
    todos.pop
  end

  def remove_at(num)
    item_at(num)
    todos.delete_at(num)
  end

  def to_s
    puts " ---- Today's Todos ----"
    todos.each { |items| puts items }
    ""
  end

  def each
    counter = 0

    while counter < todos.size
      yield(todos[counter])
      counter += 1
    end

    self # returning the calling object
  end

  def select
    list = TodoList.new(title)
    self.each do |todo|
      list.add(todo) if yield(todo)
    end
    list
  end

  def find_by_title(string)
    select { |todo| todo.title == string }.first
  end

  def all_done
    done?
  end

  def all_not_done
    select { |items| items.done == false }
  end

  def mark_done(string)
    item = find_by_title(string)
    item ? item.done! : item
  end

  def mark_all_done
    done!
  end

  def mark_all_undone
    each(&:undone!)
  end

  protected

  attr_reader :todos
end

class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end

  def ==(otherTodo)
    title == otherTodo.title &&
      description == otherTodo.description &&
      done == otherTodo.done
  end
end

# Implementing the TodoList#select method

todo1 = Todo.new("Buy milk")
todo1_1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")

list = TodoList.new("Today's Todos")
list.add(todo1)
list.add(todo1_1)
list.add(todo2)
list.add(todo3)

todo1.done!
# todo2.done!
# todo3.done!

list.find_by_title("Buy milk")
#<Todo:0x00005618232018b8 @title="Buy milk", @description="", @done=true>
list.find_by_title("Buy k") # nil

list.mark_done("Clean room")
list.mark_all_done
list.mark_all_undone
p list.all_not_done


# methods to implement
# TodoList Class  Description
# find_by_title  takes a string as argument, and returns the first Todo object that matches the argument. Return nil if no todo is found. --
# all_done  returns new TodoList object containing only the done items --
# all_not_done  returns new TodoList object containing only the not done items --
# mark_done  takes a string as argument, and marks the first Todo object that matches the argument as done. --
# mark_all_done  mark every todo as done ---
# mark_all_undone  mark every todo as not done ---
