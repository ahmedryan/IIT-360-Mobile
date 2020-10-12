import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iitappdevelopment/API_Call/call_publication.dart';
import 'package:iitappdevelopment/Model/model_publication.dart';

class PublicationScreen extends StatefulWidget {
  @override
  _PublicationScreenState createState() => _PublicationScreenState();
}

class _PublicationScreenState extends State<PublicationScreen> {
  Future<List<Publication>> futurePublication;

  @override
  void initState() {
    super.initState();
    futurePublication = fetchPublication();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Publications'),
      ),
      body: FutureBuilder(
        future: futurePublication,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, index) {
                Publication publication = snapshot.data[index];

                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Column(
                      children: [
                        Text('title: ${publication.title}'),
                        Text('type: ${publication.pubType}'),
                        Text('year: ${publication.pubYear}'),
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
