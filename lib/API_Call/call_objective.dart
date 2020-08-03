import 'package:http/http.dart' as http;
import 'package:iitappdevelopment/Attribute/url.dart';
import 'package:iitappdevelopment/Model/model_aims_n_objectives.dart';

Future<List<Objective>> fetchObjective() async {
  final response = await http.get(URL().objectiveURL);

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return aimsNObjectivesFromJson(response.body);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load aims and objectives');
  }
}
