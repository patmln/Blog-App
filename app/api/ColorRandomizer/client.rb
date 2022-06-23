module ColorRandomizer
    class Client
        def self.create
            response = Request.call(http_method:'get',endpoint:'getRandomColor')
        end

        def self.error_call
            response = Request.call(http_method:'get',endpoint:'getRandomColor3')
        end
    end
end