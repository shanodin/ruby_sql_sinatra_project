require_relative("sql_runner")
require_relative("owner")

class Animal

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @type = options['type']
    @can_adopt = options['can_adopt']
    @status = options['status']
    @admission_date = options['admission_date']
    @owner_id = options['owner_id']
  end

  def save()
    sql ="INSERT INTO animals
      (name,
      type,
      can_adopt,
      status,
      admission_date,
      owner_id)
    VALUES
      ($1, $2, $3, $4, $5, $6)
    RETURNING *;"
    values = [@name, @type, @can_adopt, @status, @admission_date, @owner_id]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def update()
    sql ="UPDATE animals SET
      (name,
      type,
      can_adopt,
      status,
      admission_date,
      owner_id)
        =
      ($1, $2, $3, $4, $5, $6)
    WHERE id = $7"
    values = [@name, @type, @can_adopt, @status, @admission_date, @owner_id, @id]
    SqlRunner.run(sql, values)
  end

  def self.map_items(animal_data)
    return animal_data.map { |animal| Animal.new(animal) }
  end

  def self.all()
    sql = "SELECT * FROM animals;"
    animal_data = SqlRunner.run( sql, [] )
    return map_items(animal_data)
  end

  def delete()
    sql = "DELETE FROM animals WHERE id = $1;"
    SqlRunner.run(sql, [@id])
  end

  def self.delete_all()
    sql = "DELETE * FROM animals;"
    SqlRunner.run(sql, [])
  end

  def self.find(id)
    sql = "SELECT * FROM animals
      WHERE id = $1;"
    result = SqlRunner.run(sql, [id]).first
    return Animal.new(result)
  end


end
