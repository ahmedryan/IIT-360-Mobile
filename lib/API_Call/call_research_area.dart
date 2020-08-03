import 'package:http/http.dart' as http;
import 'package:iitappdevelopment/Model/model_research_area.dart';

Future<List<ResearchArea>> fetchResearchArea() async {
  String url = "http://lit360.000webhostapp.com/research_area.php";
  final response = await http.get(url);

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return researchAreaFromJson(response.body);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load research area');
  }
}
