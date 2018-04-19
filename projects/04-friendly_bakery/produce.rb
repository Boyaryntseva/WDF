class Produce
    attr_accessor :name, :photo, :price, :description

    def initialize(name,photo,price,description)
        @name = name
        @price = price
        @photo = photo
        @description = description
    end
end

class Cake < Produce
    attr_accessor :name, :photo, :price, :description, :photo_close
    def initialize(name,photo,price,description,photo_close)
        @name = name
        @price = price
        @photo = photo
        @description = description
        @photo_close = photo_close
    end

    def self.all
        ObjectSpace.each_object(self).to_a
    end
end

class Eclair < Produce
    attr_accessor :name, :photo, :price, :description, :photo_close
    def initialize(name,photo,price,description,photo_close)
        @name = name
        @price = price
        @photo = photo
        @description = description
        @photo_close = photo_close
    end

    def self.all
        ObjectSpace.each_object(self).to_a
    end
end

class Cupcake < Produce
    attr_accessor :name, :photo, :price, :description, :photo_close
    def initialize(name,photo,price,description,photo_close)
        @name = name
        @price = price
        @photo = photo
        @description = description
        @photo_close = photo_close
    end

    def self.all
        ObjectSpace.each_object(self).to_a
    end
end

class Macaroon < Produce
    attr_accessor :name, :photo, :price, :description, :photo_close
    def initialize(name,photo,price,description,photo_close)
        @name = name
        @price = price
        @photo = photo
        @description = description
        @photo_close = photo_close
    end

    def self.all
        ObjectSpace.each_object(self).to_a
    end
end