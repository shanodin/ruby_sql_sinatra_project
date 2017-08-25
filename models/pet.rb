require_relative("sql_runner")
require_relative("owner")

class Pet

attr_accessor :name, :type, :breed, :can_adopt, :status, :admission_date, :owner_id
attr_reader :id

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @type = options['type']
    @breed = options['breed']
    @can_adopt = options['can_adopt']
    @status = options['status']
    @admission_date = options['admission_date']
    @owner_id = options['owner_id']
  end

  def save()
    sql ="INSERT INTO pets
      (name,
      type,
      breed,
      can_adopt,
      status,
      admission_date,
      owner_id)
    VALUES
      ($1, $2, $3, $4, $5, $6, $7)
    RETURNING *;"
    values = [@name, @type, @breed, @can_adopt, @status, @admission_date, @owner_id]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def update()
    sql ="UPDATE pets SET
      (name,
      type,
      breed,
      can_adopt,
      status,
      admission_date,
      owner_id)
        =
      ($1, $2, $3, $4, $5, $6, $7)
    WHERE id = $8"
    values = [@name, @type, @breed, @can_adopt, @status, @admission_date, @owner_id, @id]
    SqlRunner.run(sql, values)
  end

  def self.map_items(pet_data)
    return pet_data.map { |pet| Pet.new(pet) }
  end

  def self.all()
    sql = "SELECT * FROM pets;"
    pet_data = SqlRunner.run( sql, [] )
    return map_items(pet_data)
  end

  def delete()
    sql = "DELETE FROM pets WHERE id = $1;"
    SqlRunner.run(sql, [@id])
  end

  def self.delete_all()
    sql = "DELETE * FROM pets;"
    SqlRunner.run(sql, [])
  end

  def self.find(id)
    sql = "SELECT * FROM pets
      WHERE id = $1;"
    result = SqlRunner.run(sql, [id]).first
    return Pet.new(result)
  end

  def owner
    sql = "
    SELECT * FROM owners
    WHERE id = $1;"
    results = SqlRunner.run( sql, [@owner_id] )
    hash = results[0]
    owner = Owner.new(hash)
    return owner
  end

end
