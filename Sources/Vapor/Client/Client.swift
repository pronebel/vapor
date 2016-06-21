public protocol Client: Responder, Program { }

public enum ClientError: ErrorProtocol {

}

extension Client {
    public func request(_ method: Method, path: String, headers: Headers, query: [String: String], body: HTTPBody) throws -> HTTPResponse {
        let path = path.finish("/")
        var uri = try URI(path)
        uri.append(query: query)
        let request = Request(method: method, uri: uri, headers: headers, body: body)
        return try respond(to: request)
    }

    public func get(_ path: String, headers: Headers = [:], query: [String: String] = [:], body: HTTPBody = []) throws -> HTTPResponse {
        return try request(.get, path: path, headers: headers, query: query, body: body)
    }
    public func post(_ path: String, headers: Headers = [:], query: [String: String] = [:], body: HTTPBody = []) throws -> HTTPResponse {
        return try request(.post, path: path, headers: headers, query: query, body: body)
    }
    public func put(_ path: String, headers: Headers = [:], query: [String: String] = [:], body: HTTPBody = []) throws -> HTTPResponse {
        return try request(.put, path: path, headers: headers, query: query, body: body)
    }
    public func patch(_ path: String, headers: Headers = [:], query: [String: String] = [:], body: HTTPBody = []) throws -> HTTPResponse {
        return try request(.patch, path: path, headers: headers, query: query, body: body)
    }
    public func delete(_ path: String, headers: Headers = [:], query: [String: String] = [:], body: HTTPBody = []) throws -> HTTPResponse {
        return try request(.delete, path: path, headers: headers, query: query, body: body)
    }
}
