require( 'pg' )
require_relative( '../db/sql_runner' )
require_relative( 'pets')

class Store

  attr_accessor( :id, :name, :address, :type)

  def initialize( options )
    @id = options[ 'id' ].to_i
    @name = options[ 'name' ]
    @address = options[ 'address' ]
    @type = options[ 'type' ]
  end

  def save()
    sql = "INSERT INTO stores (
      name,
      address,
      type
      ) VALUES (
      '#{ @name }', 
      '#{ @address }',
      '#{ @type}'
      ) RETURNING *;"

      store = SqlRunner.run( sql ).first
      result = Store.new( store )
      return result
  end

  def update()
    sql = "UPDATE stores
            SET name = '#{@name}',
                address = '#{@address}',
                type = '#{@type}'
            WHERE id = #{@id}"
      SqlRunner.run( sql )   
  end

  def delete
    sql = "DELETE FROM stores WHERE id = #{@id}"
    store = SqlRunner.run( sql )
  end

  def self.all()
    sql = "SELECT * FROM stores"
    stores = SqlRunner.run ( sql )
    return stores.map { |store| Store.new(store) }
  end

end