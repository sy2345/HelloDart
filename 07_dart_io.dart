//dart:io - 服务器和命令行应用程序的 I/O
//(https://dart.cn/guides/libraries/library-tour#dartio)

import 'dart:io';
import 'dart:convert';

void files_and_directories() async {
  var config = File('config.txt');

//Reading a file as text
  // Put the whole file in a single string.
  var stringContents = await config.readAsString();
  print('The file is ${stringContents.length} characters long.');

  // Put each line of the file into its own string.
  var lines = await config.readAsLines();
  print('The file is ${lines.length} lines long.');
//Reading a file as binary
  var contents = await config.readAsBytes();
  print('The file is ${contents.length} bytes long.');

//Handling errors
  try {
    var contents = await config.readAsString();
    print(contents);
  } catch (e) {
    print(e);
  }
}

void processRequest(HttpRequest request) {
  print('Got request for ${request.uri.path}');
  final response = request.response;
  if (request.uri.path == '/dart') {
    response
      ..headers.contentType = ContentType(
        'text',
        'plain',
      )
      ..write('Hello from the server');
  } else {
    response.statusCode = HttpStatus.notFound;
  }
  response.close();
}

void http_clients_and_servers() async {
  final requests = await HttpServer.bind('localhost', 8888);
  await for (final request in requests) {
    processRequest(request);
  }

  var url = Uri.parse('http://localhost:8080/dart');
  var httpClient = HttpClient();
  var request = await httpClient.getUrl(url);
  var response = await request.close();
  var data = await utf8.decoder.bind(response).toList();
  print('Response ${response.statusCode}: $data');
  httpClient.close();
}

void main(List<String> args) {
  files_and_directories();
  http_clients_and_servers(); 
}
