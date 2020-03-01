import 'package:flutter/material.dart';
import 'package:v2ex_flutter/views/contentList.dart';

class ContentByNode extends StatefulWidget {
  final String url;
  final String title;
  ContentByNode({Key key,@required this.url,@required this.title}):super(key:key);
  @override
  _ContentByNodeState createState() => _ContentByNodeState();
}

class _ContentByNodeState extends State<ContentByNode> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          centerTitle: true,
        ),
        body: SafeArea(
          child: ContentList(url:widget.url),
        ),
      )
    );
  }
}
