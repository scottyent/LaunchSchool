# This class represents a todo item and its associated
# data: name and description. There's also a "done"
# flag to show whether this todo item is done.

require 'pry'
require 'pry-byebug'

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

# TODO:
# - Should only work with Todo class items, otherwise give an error, in particular
# TypeError with message "Can only add Todo objects"
# TodoList class needs:
# - add function that takes a todo object, and throws above mentioned error       :DONE
# - << same behavior as add                                                       :DONE
# - size method that returns the amount of todos in the list                      :DONE
# - first and last functions that return the appropriate item in the list         :DONE
# - To_a that returns an array of all the items                                   :DONE
# - done? boolean depending if all items are checked done or not                  :DONE
# but use fetch because it has to return an index error if it's not in the list
# - mark_done_at - same as above but marks the item done (if it's legit)          :DONE
# - mark_undone_at - same as above but marks the item not done (if it's legit)    :DONE
# - done! - marks all items done                                                  :DONE
# - shift and pop, returns removes first and last item respectively               :DONE
# - remove_at same as item_at but removes the item                                :DONE
# - to_s - formats it nicely                                                      :DONE

# This class represents a collection of Todo objects.
# You can perform typical collection-oriented actions
# on a TodoList object, including iteration and selection.

class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  def add(todo)
    raise TypeError.new "Can only add Todo objects" if todo.class != Todo
    @todos << todo
  end

  alias_method :<<, :add

  def size
    @todos.size
  end

  def first
    @todos.first
  end

  def last
    @todos.last
  end

  def to_a
    @todos.clone
  end

  def done?
    @todos.all? { |item| item.done == true }
  end

  def item_at(index)
    @todos.fetch(index)
  end

  def mark_done_at(index)
    item_at(index).done!
  end

  def mark_undone_at(index)
    item_at(index).undone!
  end

  def done!
    @todos.each { |todo| todo.done! }
  end

  def shift
    @todos.shift
  end

  def pop
    @todos.pop
  end

  def remove_at(index)
    # I chose this implementation because item_at has the catch for out of index
    # and objects are unique, so delete should work as we expect
    @todos.delete(item_at(index))
  end

  def to_s
    puts "---- Today's Todos ----"
    @todos.each { |todo| puts todo }
  end

  def each
    @todos.each do |todo|
      yield(todo)
    end
  end
end

# Test cases

todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")

list = TodoList.new("Today's Todos")
list.add(todo1)
list.add(todo2)
list.add(todo3)

list.each do |todo|
  puts todo                   # calls Todo#to_s
end