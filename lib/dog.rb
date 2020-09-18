class Dog 
  attr_accessor :name, :breed 
  attr_reader :id 
  
  def initialize(id=nil, name:, breed:)
    @name = name
    @breed = breed
    @id = id
  end 
  
  def self.create_table
    sql = "CREATE TABLE IF NOT EXISTS dogs(
      id INTEGER PRIMARY KEY,
      name TEXT,
      breed TEXT
      )"
      
      DB[:conn].execute(sql)
    end 
    
    def self.drop_table
       DB[:conn].execute("DROP TABLE IF EXISTS students")
     end 
     
     def save
  if self.id
    self.update
  else
    sql = "INSERT INTO students (name, grade)
    VALUES (?,?)"

  DB[:conn].execute(sql, self.name, self.grade)
  @id = DB[:conn].execute("SELECT last_insert_rowid() FROM students")[0][0]
  end
end

end 