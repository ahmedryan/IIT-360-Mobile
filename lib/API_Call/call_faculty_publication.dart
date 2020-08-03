import 'package:http/http.dart' as http;
import 'package:iitappdevelopment/Attribute/url.dart';
import 'package:iitappdevelopment/Model/model_faculty_publication.dart';

Future<List<FacultyPublication>> fetchFacultyPublication(
    String facultyID) async {
  String url = "${URL().facultyPublicationURL}/$facultyID";
  final response = await http.get(url);

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return facultyPublicationFromJson(response.body);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load faculty publication');
  }
}
