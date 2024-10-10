require "socket"
require "json"
require "active_support/all"

port = ENV.fetch("PORT", 9898).to_i
server = TCPServer.new port
puts "Listening on port #{port}..."

def handle_request(request)
  method, path, _ = request.split(" ")

  case [method, path]
  when ["GET", "/ping"]
    { code: 200, body: "Pong!" }
  else
    { code: 404, body: "Not Found" }
  end
end

def send_response(client, response)
  status_line = case response[:code]
                when 200 then "HTTP/1.1 200 OK\r\n"
                when 404 then "HTTP/1.1 404 Not Found\r\n"
                when 400 then "HTTP/1.1 400 Bad Request\r\n"
                else "HTTP/1.1 500 Internal Server Error\r\n"
                end

  headers = response[:headers] || { "Content-Type" => "text/html" }
  headers_section = headers.map { |k, v| "#{k}: #{v}" }.join("\r\n")

  client.write(status_line)
  client.write(headers_section + "\r\n\r\n")
  client.write(response[:body]) if response[:body]
end

loop do
  Thread.start(server.accept) do |client|
    request = client.readpartial(2048)
    response = handle_request(request)
    send_response(client, response)
    client.close
  end
end
