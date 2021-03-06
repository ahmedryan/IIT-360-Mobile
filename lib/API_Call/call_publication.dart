import 'package:http/http.dart' as http;
import 'package:iitappdevelopment/Attribute/url.dart';
import 'package:iitappdevelopment/Model/model_publication.dart';

Future<List<Publication>> fetchPublication() async {
  final response = await http.get(URL().publicationURL);

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return publicationFromJson(response.body);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load publication');
  }
}
