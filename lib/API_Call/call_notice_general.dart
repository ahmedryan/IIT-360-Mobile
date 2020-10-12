import 'package:http/http.dart' as http;
import 'package:iitappdevelopment/Attribute/url.dart';
import 'package:iitappdevelopment/Model/model_notice.dart';

Future<List<Notice>> fetchNoticeBSSE() async {
  final response = await http.get(URL().bsseNoticeUrl);
  if (response.statusCode == 200)
    return noticeFromJson(response.body);
  else
    throw Exception('Failed to load notice');
}

Future<List<Notice>> fetchNoticeMSSE() async {
  final response = await http.get(URL().msseNoticeUrl);
  if (response.statusCode == 200)
    return noticeFromJson(response.body);
  else
    throw Exception('Failed to load notice');
}

Future<List<Notice>> fetchNoticeMIT() async {
  final response = await http.get(URL().mitNoticeUrl);
  if (response.statusCode == 200)
    return noticeFromJson(response.body);
  else
    throw Exception('Failed to load notice');
}

Future<List<Notice>> fetchNoticePGDIT() async {
  final response = await http.get(URL().pgditNoticeUrl);
  if (response.statusCode == 200)
    return noticeFromJson(response.body);
  else
    throw Exception('Failed to load notice');
}

Future<List<Notice>> fetchNoticeDesign() async {
  final response = await http.get(URL().webDesignUrl);
  if (response.statusCode == 200)
    return noticeFromJson(response.body);
  else
    throw Exception('Failed to load notice');
}

Future<List<Notice>> fetchNoticeMatlab() async {
  final response = await http.get(URL().matlabOriginLatexUrl);
  if (response.statusCode == 200)
    return noticeFromJson(response.body);
  else
    throw Exception('Failed to load notice');
}

Future<List<Notice>> fetchNoticeMobile() async {
  final response = await http.get(URL().mobileApplicationUrl);
  if (response.statusCode == 200)
    return noticeFromJson(response.body);
  else
    throw Exception('Failed to load notice');
}

Future<List<Notice>> fetchNoticeOffice() async {
  final response = await http.get(URL().officeApplicationUrl);
  if (response.statusCode == 200)
    return noticeFromJson(response.body);
  else
    throw Exception('Failed to load notice');
}

Future<List<Notice>> fetchNoticeProgramming() async {
  final response = await http.get(URL().webProgrammingUrl);
  if (response.statusCode == 200)
    return noticeFromJson(response.body);
  else
    throw Exception('Failed to load notice');
}

Future<List<Notice>> fetchNoticeProject() async {
  final response = await http.get(URL().projectNoticeUrl);
  if (response.statusCode == 200)
    return noticeFromJson(response.body);
  else
    throw Exception('Failed to load notice');
}

Future<List<Notice>> fetchNoticeRegistrar() async {
  final response = await http.get(URL().registrarOffice);
  if (response.statusCode == 200)
    return noticeFromJson(response.body);
  else
    throw Exception('Failed to load notice');
}

Future<List<Notice>> fetchNoticeScholarship() async {
  final response = await http.get(URL().scholarshipNoticeUrl);
  if (response.statusCode == 200)
    return noticeFromJson(response.body);
  else
    throw Exception('Failed to load notice');
}
