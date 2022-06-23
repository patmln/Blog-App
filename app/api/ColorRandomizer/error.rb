module ColorRandomizer
    class Error
        def self.map(code)
            case code
            when 404
                return 'Unauthorized request! Please try again'
            when 401
                return 'Please try again'
            else
                return 'Invalid Request'
            end
        end
    end
end