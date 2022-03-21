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
          return _buildPosts(context, posts);
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  // build list view & its tile
  ListView _buildPosts(BuildContext context, ImagesResponse posts) {
    return ListView.builder(
      itemCount: posts.rows?.length,
      padding: EdgeInsets.all(8),
      itemBuilder: (context, index) {
        return Card(
          elevation: 4,
          child: ListTile(
           ,
          ),
        );
      },
    );
  }
}
