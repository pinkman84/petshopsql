require( 'pg' )
require_relative( '../db/sql_runner' )
require_relative( 'store' )

class Pet

  attr_accessor( :id, :name, :type, :image, :store_id)

  def initialize( options )
    @id = options[ 'id' ].to_i
    @name = options[ 'name' ]
    @pet_type = options[ 'pet_type' ]
    @image = options[ 'image' ]
    @store_id = options[ 'store_id' ].to_i
  end

  def save()
    sql = "INSERT INTO pets (name, type, image, store_id) VALUES ('#{ @name }', '#{ @pet_type }', '#{ @image }', #{@store_id} RETURNING *);"
      pet = SqlRunner.run( sql )
      result = Pet.new( pet )
      return result
  end

  def update()
    sql = "UPDATE pets
            SET name = '#{@name}',
                type = '#{@type}',
                image = '#{@image}',
                store_id = '#{@store_id}'
            WHERE id = #{@id}"
      SqlRunner.run( sql ) 
  end

  def delete
    sql = "DELETE FROM pets WHERE id = #{@id}"
    SqlRunner.run( sql )
  end

  def self.all()
    sql = "SELECT * FROM pets"
    pets = SqlRunner.run ( sql )
    return pets.map { |pet| Pet.new(pet) }
  end

  def list_of_pets()
    sql = "SELECT pets.name, store.name, store.address 
            FROM pets
            INNER JOIN
            stores
            WHERE id = #{@id}"
    pet_type_list = SqlRunner.run( sql )
    return pet_type_list.map { |pet| Pet.new(pet_type_list)}        
  end


end