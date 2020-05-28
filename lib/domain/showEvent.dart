import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uevents/data/data.dart';
import 'package:uevents/domain/user.dart';
import 'package:uevents/services/database.dart';
import 'package:uevents/domain/eventCard.dart';

class WorkoutsList extends StatefulWidget {
  @override
  _WorkoutsListState createState() => _WorkoutsListState();
}

class _WorkoutsListState extends State<WorkoutsList> {
  User user;
  DatabaseService db = DatabaseService();
  var showsEvents = List<Data>();

  void filter() {
    loadData();
  }

  loadData() async {
    var stream = db.getEvents();

    stream.listen((List<Data> data) {
      setState(() {
        showsEvents = data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    filter();
    user = Provider.of<User>(context);
    var eventlists = Expanded(
        child: ListView.builder(
            itemCount: showsEvents.length,
            itemBuilder: (context, i) {
              return EventCard.createCard(showsEvents[i]);
            }));

    return Column(children: [
      eventlists,
    ]);
  }
}
