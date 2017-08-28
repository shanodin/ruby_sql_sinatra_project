require_relative("sql_runner")
require_relative("owner")
require_relative("pet")

class Adoption

  def initialize(options)
    @id = options["id"].to_i if options['id']
    @owner_id = options['owner_id'].to_i
    @pet_id = options['pet_id'].to_i
  end

  def save()
    sql = "INSERT INTO adoptions
      (owner_id,
      pet_id)
    VALUES
      ($1, $2)
    RETURNING id"
    values = [@owner_id, @pet_id]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def update()
    sql = " UPDATE adoptions SET
      (owner_id,
      pet_id)
        =
      ($1, $2)
      WHERE id = $3"
    values = [@owner_id, @pet_id, @id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM adoptions;"
    results = SqlRunner.run( sql, [] )
    return results.map { |adoption| Adoption.new(adoption) }
  end

  def owner()
    sql = "SELECT * FROM owners
    WHERE id = $1"
    results = SqlRunner.run( sql, [@owner_id] )
    return Owner.new( results.first )
  end

  def pets()
    sql = "SELECT * FROM pets
    WHERE id = $1;"
    results = SqlRunner.run( sql, [@pet_id] )
    return Pet.new( results.first )
  end

  def self.delete_all()
    sql = "DELETE FROM adoptions"
    SqlRunner.run( sql, [] )
  end

  def delete()
    sql = "DELETE FROM adoptions WHERE id = $1;"
    SqlRunner.run(sql, [@id])
  end

  def self.find(id)
    sql = "SELECT * FROM adoptions
      WHERE id = $1;"
    result = SqlRunner.run(sql, [id]).first
    adoption = Adoption.new(result)
    return adoption
  end

  def pet()
    sql = "SELECT * FROM pets
      WHERE id = $1;"
    result = SqlRunner.run(sql, [@pet_id])
    return Pet.new(result.first)
  end

  def owner()
    sql = "SELECT * FROM owners
      WHERE id = $1;"
    result = SqlRunner.run(sql, [@owner_id])
    return Owner.new(result.first)
  end

end
