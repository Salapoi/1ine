require 'forwardable'

module Lahti
    class Token
        extend Forwardable

        attr_reader :type, :lexeme, :location
        def_delegators :@location, :line, :col, :length

        def initialize(type, lexeme, location)
            @type = type
            @lexeme = lexeme
            @location = location
        end

        def to_s
            "#{type} #{lexeme} #{literal}"
          end
      
          def ==(other)
            type == other.type &&
            lexeme == other.lexeme &&
            location == other.location
          end
    end
end