import 'package:counter_7/page/drawer.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:counter_7/model/mywatchlistmodel.dart';
import 'package:counter_7/page/moviedetails.dart';



class MyWatchlistPage extends StatefulWidget {
  const MyWatchlistPage({super.key});

  @override
  State<MyWatchlistPage> createState() => _MyWatchlistPageState();
}

class _MyWatchlistPageState extends State<MyWatchlistPage> {
  Future<List<MyWatchlist>> fetchMyWatchlist() async {
    var url = Uri.parse('https://pbp-nicole-assignment3.herokuapp.com/mywatchlist/json/');
    var response = await http.get(
      url,
      headers: {
        "Access-Control-Allow-Origin": "*",
        "Content-Type": "application/json",
      },
    );

    var data = jsonDecode(utf8.decode(response.bodyBytes));

    List<MyWatchlist> listMyWatchlist = [];
    for (var d in data) {
      if (d != null) {
        listMyWatchlist.add(MyWatchlist.fromJson(d["fields"]));
      }
    }

    return listMyWatchlist;
  }
  
  getBorderColor(bool watchedStatus) {
    if (watchedStatus) {
      return Colors.green;
    } else {
      return Colors.red;
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Watchlist'),
      ),
      drawer: displayDrawer.display(context),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: FutureBuilder(
          future: fetchMyWatchlist(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return const Center(child: CircularProgressIndicator());
            } else {
              if (!snapshot.hasData) {
                return Column(
                  children: const [
                    Text("Watchlist is empty", style: TextStyle(color: Colors.red, fontSize:20),),
                    SizedBox(height:8),
                  ],
                );
              } else {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (_, index) => Center(
                    child: Card(
                      child: Column(
                        children: [
                          // CheckboxListTile(
                          //   title: Text("${snapshot.data![index].title}"),
                          //   value: snapshot.data![index].watched,
                          //   onChanged: (bool? value) {
                          //     setState(() {
                          //       snapshot.data![index].watched = !snapshot.data![index].watched;
                          //     });
                          //   }
                          // ),
                          ListTile(
                            title: Text("${snapshot.data![index].title}"),
                            trailing: Checkbox(
                              value: snapshot.data![index].watched,
                              onChanged: (bool? value) {
                                setState(() {
                                  snapshot.data![index].watched = !snapshot.data![index].watched;
                                });
                              }
                            ),
                            shape: RoundedRectangleBorder(
                              side: BorderSide(color: getBorderColor(snapshot.data![index].watched)),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => MovieDetailsPage(
                                  movie: snapshot.data![index]
                                ))
                              );
                            }
                          ),
                        ]
                      ),
                    ),
                  )
                );
              }
            }
          }
        )
      )
    );
  }
}