import 'package:http/http.dart' as http;
import 'package:iitappdevelopment/Attribute/url.dart';
import 'package:iitappdevelopment/Model/model_routine.dart';
import 'package:iitappdevelopment/Services/global_variable.dart' as global;

Future<List<Routine>> fetchRoutine() async {
  final response = await http.get('${URL().routineURL}${global.user.email}');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return routineFromJson(response.body);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load routine');
  }
}
