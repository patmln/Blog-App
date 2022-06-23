require 'rest-client'

module CommentCreator
    class Request
        BASE_URL = 'https://jsonplaceholder.typicode.com/'
        def self.call(http_method:,endpoint:)
            result = RestClient::Request.execute(
                method: http_method,
                url: "#{BASE_URL}#{endpoint}",
                headers: {'Content-Type' => 'application/json'}
            )
            {code: result.code, status: 'Success', data:JSON.parse(result)}
        rescue RestClient::ExceptionWithResponse => error
            {code: error.http_code, status: error.message, data:Error.map(error.http_code)}
        end
    end
end