import 'package:counter_7/page/drawer.dart';
import 'package:flutter/material.dart';


class MovieDetailsPage extends StatefulWidget {
  const MovieDetailsPage({
    super.key,
    required this.movie,
  });

  final movie;

  @override
  State<MovieDetailsPage> createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
      ),
      drawer: displayDrawer.display(context),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Text(widget.movie.title, style: const TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold))
            ),
            SizedBox(height: 20),
            RichText(
              text: TextSpan(
                style: const TextStyle(fontSize: 18.0, color: Colors.black),
                children: <TextSpan>[
                  TextSpan(text: 'Release Date: ', style: const TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: "${widget.movie.releaseDate}"),
                ]
              )
            ),
            SizedBox(height: 7),
            RichText(
                text: TextSpan(
                    style: const TextStyle(fontSize: 18.0, color: Colors.black),
                    children: <TextSpan>[
                      TextSpan(text: 'Rating: ', style: const TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: "${widget.movie.rating}/5"),
                    ]
                )
            ),
            SizedBox(height: 7),
            RichText(
                text: TextSpan(
                    style: const TextStyle(fontSize: 18.0, color: Colors.black),
                    children: <TextSpan>[
                      TextSpan(text: 'Status: ', style: const TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: "${widget.movie.watched}"),
                    ]
                )
            ),
            SizedBox(height: 7),
            RichText(
                text: TextSpan(
                    style: const TextStyle(fontSize: 18.0, color: Colors.black),
                    children: <TextSpan>[
                      TextSpan(text: 'Review: ', style: const TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: "${widget.movie.review}"),
                    ]
                )
            ),
            Expanded(
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    primary: Colors.white,
                    minimumSize: const Size.fromHeight(50),
                  ),
                  onPressed: () {Navigator.pop(context);},
                  child: Text("Back"),
                )
              )
            ),
          ],
        ),
      ),
    );
  }
}