import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iitappdevelopment/API_Call/call_research_area.dart';
import 'package:iitappdevelopment/Model/model_research_area.dart';

class ResearchAreaScreen extends StatefulWidget {
  @override
  _ResearchAreaScreenState createState() => _ResearchAreaScreenState();
}

class _ResearchAreaScreenState extends State<ResearchAreaScreen> {
  Future<List<ResearchArea>> futureResearchArea;

  @override
  void initState() {
    super.initState();
    futureResearchArea = fetchResearchArea();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: futureResearchArea,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, index) {
                ResearchArea researchArea = snapshot.data[index];

                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(researchArea.fieldName),
                            )),
                        Expanded(
                            flex: 3,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(researchArea.areaDescription),
                            )),
                      ],
                    ),
                  ),
                );
              },
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
