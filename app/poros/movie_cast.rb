class MovieCast
  attr_reader :name,
              :character

  def initialize(attributes)
    # @cast = attributes[:cast]
    @name = attributes[:name]
    @character = attributes[:character]
  end
end