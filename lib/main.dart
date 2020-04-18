import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './zournal.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var journals = [];

  Future loadZournal() async {
    String content = await rootBundle.loadString('assets/journals.json');
    List collection = json.decode(content);
    List<JournalList> _journals =
        collection.map((json) => JournalList.fromJson(json)).toList();

    setState(() {
      journals = _journals;
    });
  }

  @override
  void initState() {
    loadZournal();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(builder: (context) => Scaffold(
        appBar: AppBar(
          title: Text('List Appp'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(context: context, delegate: DataSearch());
              },
            ),
          ],
        ),
        drawer: Drawer(),
        body: Container(
          child: ListView.separated(
            separatorBuilder: (context, index) => Divider(),
            itemCount: journals.length,
            itemBuilder: (BuildContext context, int index) {
              JournalList journal = journals[index];

              return ListTile(
                title: Text(
                  journal.name,
                  style: TextStyle(
                      color: Colors.pink, fontWeight: FontWeight.bold),
                ),
                subtitle: Text('IF: ' + journal.impact),
                leading: CircleAvatar(
                  child: Text(journal.number),
                ),
              );
            },
          ),
        ),
      ),)
    );
  }
}

class DataSearch extends SearchDelegate<String> {
  // final journals = JournalList;
  // Future<List> loadMyApp() async {
  //   String content = await rootBundle.loadString('assets/journals.json');
  //   return json.decode(content);
  // }  I'VE TRIED SINCE METHOD TO ACTIVATE THE JOURNALLIST FROM THE FILE ZOURNAL.DART, BUT IT DOES NOT,

//Below r some simple tests I tried, but the search icon is not working
  final journals = [
    'Nature Reviews Materials',
    'New England Journal Of Medicine',
    'Lancet',
    'Chemical Reviews',
    'Science',
    'Cell',
    'World Psychiatr',
    'Annual Review Of Astronomy And Astrophysics',
    'Journal Of Clinical Oncology',
    'Cancer Communications',
    'Advanced Materials',
    'Pharmacological Review',
    'Blood',
    'Endocrine Reviews',
  ];

  final recentJournals = [
    'World Psychiatr',
    'Annual Review Of Astronomy And Astrophysics',
    'Journal Of Clinical Oncology',
    'Cancer Communications',
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    return null;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? recentJournals
        : journals.where((p) => p.startsWith(query)).toList();
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        leading: Icon(Icons.location_city),
        title: Text(suggestionList[index]),
      ),
      itemCount: suggestionList.length,
    );
  }
}
