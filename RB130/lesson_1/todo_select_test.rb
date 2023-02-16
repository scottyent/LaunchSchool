require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'todo_select'

class TodoListTest < MiniTest::Test

  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  def test_to_a
    assert_equal(@todos, @list.to_a)
  end

  def test_size
    assert_equal(3, @list.size)
  end

  def test_first
    assert_equal(@todo1, @list.first)
  end

  def test_last
    assert_equal(@todo3, @list.last)
  end

  def test_shift
    todo = @list.shift
    assert_equal(@todo1, todo)
    assert_equal([@todo2, @todo3], @list.to_a)
  end

  def test_pop
    todo = @list.pop
    assert_equal(@todo3, todo)
    assert_equal([@todo1, @todo2], @list.to_a)
  end

  def test_done?
    assert_equal(false, @list.done?)
    @list.mark_all_done
    assert_equal(true, @list.done?)
  end

  def test_adding_wrong_type
    test_values = [5, "5", 5.0, [5], {5 => "5"}]

    test_values.each do |value|
      assert_raises(TypeError) { @list.add(value) }
    end
  end

  def test_add
    test_todo = Todo.new("fourth thing")
    @list.add(test_todo)

    assert_equal(4, @list.size)
    assert_includes(@list.to_a, test_todo)
  end

  def test_shovel_alias
    test_todo = Todo.new("example")

    # I thought I was testing that it was literally aliased, which in this
    # case I ran it to catch a type error because that error is only raised
    # in add, and not in the shovel operator
    assert_raises(TypeError) { @list << 5 }

    @list << test_todo
    assert_equal(4, @list.size)
    assert_includes(@list.to_a, test_todo)
  end

  def test_item_at
    assert_equal(@todo1, @list.item_at(0))
    assert_equal(@todo3, @list.item_at(2))
    assert_raises(IndexError) { @list.item_at(5) }
  end

  def test_mark_done_at
    @list.mark_done_at(0)
    assert_equal(true, @list.item_at(0).done?)
    assert_equal(false, @list.item_at(1).done?)
    assert_equal(false, @list.item_at(2).done?)

    assert_raises(IndexError) { @list.mark_done_at(5) }
  end

  def test_mark_undone_at
    @list.mark_all_done
    assert_equal(true, @list.item_at(0).done?)
    assert_equal(true, @list.item_at(1).done?)
    assert_equal(true, @list.item_at(2).done?)

    @list.mark_undone_at(0)
    assert_equal(false, @list.item_at(0).done?)
    assert_equal(true, @list.item_at(1).done?)
    assert_equal(true, @list.item_at(2).done?)
    assert_raises(IndexError) { @list.mark_undone_at(5) }
  end

  def test_done!
    @list.done!
    assert_equal(true, @list.item_at(0).done?)
    assert_equal(true, @list.item_at(1).done?)
    assert_equal(true, @list.item_at(2).done?)
    assert_equal(true, @list.done?)
  end

  def test_remove_at
    assert_raises(IndexError) { @list.item_at(5) }
    removed_todo = @list.remove_at(1)
    assert(removed_todo == @todo2)
    assert_equal([@todo1, @todo3], @list.to_a)
  end

  def test_to_s
    expected = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT

    assert_equal(expected, @list.to_s)
  end

  def test_to_s__one_done
    expected = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [X] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT

    @todo1.done!
    assert_equal(expected, @list.to_s)
  end

  def test_to_s__all_done
    expected = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [X] Buy milk
    [X] Clean room
    [X] Go to gym
    OUTPUT

    @list.done!
    assert_equal(expected, @list.to_s)
  end

  def test_each
    caught_iterations = []
    @list.each { |item| caught_iterations << item }
    assert_equal(@todos, caught_iterations)
  end

  def test_each_return_value
    result = @list.each { |item| nil }
    assert_equal(@list, result)
  end

  def test_select
    @todo1.done!
    result = @list.select { |todo| todo.done? }

    assert_equal([@todo1], result.to_a)
  end

  def test_select_return_value
    result = @list.select { |todo| todo.done? }
    assert_equal(TodoList, result.class)
  end

  def test_find_by_title
    found = @list.find_by_title('Go to gym')
    assert_equal(@todo3, found)

    not_found = @list.find_by_title('Pickles')
    assert_equal(nil, not_found)
  end

end