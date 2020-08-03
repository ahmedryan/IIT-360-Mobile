import 'package:iitappdevelopment/API_Call/call_iitian.dart';
import 'package:iitappdevelopment/Model/model_iitian.dart';

class IITIANList {
  List<IITIAN> iitians = List<IITIAN>();

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

    print('size: ${iitians.length}');

    iitians.forEach(
      (element) {
        print('Name: ${element.iitianMail}');
      },
    );
  }
}

class IITIANInitialization {
  IITIANList _iitianList = IITIANList();
  List<IITIAN> _iitian = List<IITIAN>();

  getIITIAN() {
    return _iitian;
  }

  Future<String> initialize() async {
    await _iitianList.loadData();
    print('hoho: ${_iitianList.iitians.length}');
    _iitian.addAll(_iitianList.iitians);
    print('hehe: ${_iitian.length}');

    return 'IITian has been initialized';
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
