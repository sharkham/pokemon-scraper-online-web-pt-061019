class Pokemon

  attr_accessor :id, :name, :type, :db

  def initialize(id: nil, name:, type:, db: DB)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id_num, db)
    results = db.execute("SELECT * FROM pokemon WHERE id = ?", id_num).flatten
    self.new(id:results[0], name:results[1], type:results[2], db:db)
  end
end
