import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iitappdevelopment/API_Call/call_industry.dart';
import 'package:iitappdevelopment/Attribute/url.dart';
import 'package:iitappdevelopment/Model/model_industry.dart';

class IndustryScreen extends StatefulWidget {
  @override
  _IndustryScreenState createState() => _IndustryScreenState();
}

class _IndustryScreenState extends State<IndustryScreen> {
  Future<List<Industry>> futureIndustry;

  @override
  void initState() {
    super.initState();
    futureIndustry = fetchIndustry();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Industries'),
      ),
      body: Container(
        child: FutureBuilder(
          future: futureIndustry,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, index) {
                  Industry industry = snapshot.data[index];

                  return Card(
                    child: ListTile(
                      title: Text(industry.industryName),
                      //subtitle: Text(industry.indLink),
                      trailing: Image.network(
                          '${URL.host}/api/Images/${industry.indIcon}'),
                    ),
                  );
                },
              );
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
