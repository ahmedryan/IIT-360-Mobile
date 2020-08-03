import 'package:iitappdevelopment/API_Call/call_cr.dart';
import 'package:iitappdevelopment/Model/model_cr.dart';

class CRList {
  List<CR> crs = List<CR>();

  Future<void> loadData() async {
    var jsonBody = await fetchCR();

    for (var data in jsonBody) {
      crs.add(
        CR(
          crMailId: data.crMailId,
          semester: data.semester,
        ),
      );
    }

    crs.forEach(
      (element) {
        print('CR: ${element.crMailId}');
      },
    );
  }
}

class CRInitialization {
  CRList _crList = CRList();
  List<CR> _cr = List<CR>();

  getCR() {
    return _cr;
  }

  Future<String> initialize() async {
    await _crList.loadData();
    _cr.addAll(_crList.crs);

    return 'CR has been initialized';
  }
}
