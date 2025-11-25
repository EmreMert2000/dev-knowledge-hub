//get=veri çekme işlemi
//post=veri gönderme işlemi
import 'dart:convert';
import 'package:http/http.dart' as http;

class RestAPI {
  final String baseUrl; //temel url

  RestAPI(this.baseUrl);

  Future<dynamic> getRequest(String endpoint) async {
    final response = await http.get(Uri.parse('$baseUrl$endpoint'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<dynamic> postRequest(
    String endpoint,
    Map<String, dynamic> data,
  ) async {
    final response = await http.post(
      Uri.parse('$baseUrl$endpoint'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(data),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to send data');
    }
  }
}
//Temel bir Rest API istemcisi oluşturduk. getRequest metodu veri çekmek için, postRequest metodu ise veri göndermek için kullanılır.
//Kullanımı ise şu şekildedir:
/*
void main() async {
  final api = RestAPI('https://jsonplaceholder.typicode.com/');

  // GET isteği örneği
  try {

    final data = await api.getRequest('posts/1');
    print('GET Response: $data');
  } catch (e) {
    print(e);
  }
  // POST isteği örneği
  try {
    final postData = {
      'title': 'foo',
      'body': 'bar',
      'userId': 1,
    };
    final response = await api.postRequest('posts', postData);
    print('POST Response: $response');
  } catch (e) {

    print(e);
  }
}
*/