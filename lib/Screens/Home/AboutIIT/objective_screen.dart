import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iitappdevelopment/API_Call/call_objective.dart';
import 'package:iitappdevelopment/Model/model_aims_n_objectives.dart';

class ObjectiveScreen extends StatefulWidget {
  @override
  _AimsNObjectivesState createState() => _AimsNObjectivesState();
}

class _AimsNObjectivesState extends State<ObjectiveScreen> {
  Future<List<Objective>> futureAimsNObjectives;

  @override
  void initState() {
    super.initState();
    futureAimsNObjectives = fetchObjective();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Objective'),
      ),
      body: Container(
        child: FutureBuilder(
          future: futureAimsNObjectives,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, index) {
                  Objective aimsNobjectives = snapshot.data[index];
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      '# ${aimsNobjectives.aim}',
                      style: TextStyle(fontSize: 15),
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
