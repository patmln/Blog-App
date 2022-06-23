module CommentCreator
    class Client
        def self.create
            response = Request.call(http_method:'get',endpoint:'comments')
        end

        def self.error_call
            response = Request.call(http_method:'get',endpoint:'comments/112423')
        end
    end
end