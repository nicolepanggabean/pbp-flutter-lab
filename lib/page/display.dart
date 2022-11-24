import 'package:counter_7/page/form.dart';
import 'package:counter_7/page/drawer.dart';
import 'package:flutter/material.dart';


class MyDisplayPage extends StatefulWidget {
  const MyDisplayPage({super.key});

  @override
  State<MyDisplayPage> createState() => _MyDisplayPageState();
}

class _MyDisplayPageState extends State<MyDisplayPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form'),
      ),
      drawer: displayDrawer.display(context),
      body: Center(
        child: ListView(
          children: <Widget>[
            for (var budgetItem in SavedData.budgetRepo)
              Center(
                child: Card(
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(budgetItem['Title']),
                      ),
                      ListTile(
                        leading: Text("Rp. ${budgetItem['Total']}"),
                        trailing: Text(budgetItem['Type']),
                      )
                    ]
                  )
                )
              )
          ],
        ),
      ),
    );
  }
}