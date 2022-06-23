module PostCreator
    class Client
        def self.create
            response = Request.call(http_method:'get',endpoint:'posts')
        end

        def self.error_call
            response = Request.call(http_method:'get',endpoint:'posts/112423')
        end
    end
end