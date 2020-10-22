import 'package:iitappdevelopment/API_Call/call_iitian.dart';
import 'package:iitappdevelopment/Model/model_iitian.dart';

class IITIANList {
  List<IITIAN> iitians = new List<IITIAN>();

  Future<void> loadData() async {
    var jsonBody = await fetchIITIAN();

    for (var data in jsonBody) {
      iitians.add(
        IITIAN(
          iitianName: data.iitianName,
          iitianMail: data.iitianMail,
          semesterCi: data.semesterCi,
          connected: data.connected,
          lastUpdate: data.lastUpdate,
        ),
      );
    }

    print('Number of IITians: ${iitians.length}');

    iitians.forEach(
      (oneIitian) {
        print('IITian: ${oneIitian.iitianMail}');
      },
    );
  }
}

class IITIANInitialization {
  IITIANList _iitianList = new IITIANList();
  List<IITIAN> _iitian = new List<IITIAN>();

  getIITIAN() {
    return _iitian;
  }

  Future<String> initialize() async {
    await _iitianList.loadData();
    _iitian.addAll(_iitianList.iitians);
    return 'All IITians are registered to local storage!';
  }

  String searchUser(String mail) {
    print('length: ${_iitian.length}');
    for (int i = 0; i < _iitian.length; i++) {
      if (mail == _iitian[i].iitianMail) {
        return _iitian[i].iitianMail;
      }
    }
    return '';
  }
}
