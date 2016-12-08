class Task
  attr_reader(:description, :list_id)

  define_method(:initialize) do |attributes|
    @description = attributes.fetch(:description)
    @list_id = attributes.fetch(:list_id)
  end

  define_singleton_method(:all) do
    returned_tasks = DB.exec("SELECT * FROM tasks;")
    tasks = []
    returned_tasks.each() do |task|
      description = task.fetch("description")
      list_id = task.fetch("list_id").to_i() # The information comes out of the database as a string.
      tasks.push(Task.new({:description => description, :list_id => list_id}))
    end
    tasks
  end

  define_method(:save) do
    DB.exec("INSERT INTO tasks (description, list_id) VALUES ('#{@description}', #{@list_id});")
  end

  define_method(:==) do |another_task|
    self.description().==(another_task.description()).&(self.list_id().==(another_task.list_id()))
  end
end


#update task ??
  define_method(:update) do |attributes|
      @name = attributes.fetch(:name)
      @id = self.id()
      DB.exec("UPDATE tasks SET name = '#{@name}' WHERE id = #{@id};")
    end
#delete task ??
  define_method(:delete) do
    DB.exec("DELETE FROM lists WHERE id = #{self.id()};")
    DB.exec("DELETE FROM tasks WHERE list_id = #{self.id()};")

  end

  # #Delete entire table
  #   define_singleton_method(:clear) do
  #     DB.exec("TRUNCATE TABLE tasks;")
  #   end
