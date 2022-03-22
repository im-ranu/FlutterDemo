import 'dart:collection';
import 'package:flutter/material.dart';
import 'images_response.dart';
import 'network.dart';
import 'images.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
// to set the root of app.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'API Demo Page'),
    );
  }
}

class MyHomePage extends StatefulWidget  {

  final String title;

  MyHomePage({Key? key, required this.title}) : super(key: key);


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Artivatic"),
      ),
      body: _buildBody(context),
    );
  }

  // build list view & manage states
  FutureBuilder<ImagesResponse> _buildBody(BuildContext context) {
    final Network httpService = Network();
    return FutureBuilder<ImagesResponse>(

      future: httpService.getPosts(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final ImagesResponse posts = snapshot.data!;
          return _buildPosts(context, posts.rows!);
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  // build list view & its tile
  ListView _buildPosts(BuildContext context, List<Rows> posts) {
    return ListView.builder(
      itemCount: posts.length,
      padding: EdgeInsets.all(8),
      itemBuilder: (context, index) {
        if(posts[index].imageHref!=null){
          if(posts[index].description!=null){
            return  Card(
              child: Container(
                height: 300,
                width: double.infinity,

                child: ClipRect(
                  child: Image.network(posts[index].imageHref!),
                ),


              ),
              margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 5.0),
            );
          }
        }
        return Text("Null Value Expected");
      },
    );
  }
}
