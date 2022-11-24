import 'package:counter_7/page/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SavedData {
  static List budgetRepo = [];
}

class MyFormPage extends StatefulWidget {
  const MyFormPage({super.key});

  @override
  State<MyFormPage> createState() => _MyFormPageState();
}

class _MyFormPageState extends State<MyFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _title = "";
  int _total = 0;
  String? budgetType;
  List<String> listBudgetTypes = ['Expense', 'Income'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form'),
      ),
      drawer: displayDrawer.display(context),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Padding(
                  // Using padding of 8 pixels
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Example: Black Panther Movie Tickets",
                      labelText: "Title",
                      // Add icons to make it more intuitive
                      icon: const Icon(Icons.aod),
                      // Added a circular border to make it neater
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    // Added behavior when name is typed
                    onChanged: (String? value) {
                      setState(() {
                        _title = value!;
                      });
                    },
                    // Added behavior when data is saved
                    onSaved: (String? value) {
                      setState(() {
                        _title = value!;
                      });
                    },
                    // Validator as form validation
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Title cannot be empty!';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  // Using padding of 8 pixels
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9.,]')),],
                    decoration: InputDecoration(
                      hintText: "Example: 30000",
                      labelText: "Total",
                      // Add icons to make it more intuitive
                      icon: const Icon(Icons.attach_money_rounded),
                      // Added a circular border to make it neater
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    // Added behavior when name is typed
                    onChanged: (String? value) {
                      setState(() {
                        _total = int.parse(value!);
                      });
                    },
                    // Added behavior when data is saved
                    onSaved: (String? value) {
                      setState(() {
                        _total = int.parse(value!);
                      });
                    },
                    // Validator as form validation
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Total cannot be empty!';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  // Using padding of 8 pixels
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(Icons.compare_arrows),
                      SizedBox(width:10),
                      DropdownButton(
                        hint: Text("Choose Type"),
                        value: budgetType,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        items: listBudgetTypes.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            budgetType = newValue!;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      SavedData.budgetRepo.add({'Title': _title, 'Total': _total, 'Type': budgetType});

                      showDialog(
                        context: context,
                        builder: (context) {
                          return Dialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            elevation: 15,
                            child: ListView(
                              padding: const EdgeInsets.only(top: 20, bottom: 20),
                              shrinkWrap: true,
                              children: <Widget>[
                                Center(child: Text("Saved!"),),
                                SizedBox(height: 20),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(builder: (context) => const MyFormPage()),
                                    );
                                  },
                                  child: Text('Back'),
                                )
                              ]
                            )
                          );
                        }
                      );
                    }
                  },
                  child: const Text(
                    "Save",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}