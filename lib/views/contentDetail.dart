import 'package:flutter/material.dart';
import './introduction.dart';
import './replyList.dart';

class ContentDetail extends StatefulWidget {
  final content;
  ContentDetail({Key key,@required this.content}) : super(key: key);

  @override
  _ContentDetailState createState() => _ContentDetailState();
}

class _ContentDetailState extends State<ContentDetail> with SingleTickerProviderStateMixin {
  final List<Tab> tabs = <Tab>[
    Tab(text: '正文',),
    Tab(text: '列表',),
  ];

  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = new TabController(vsync:this,length: tabs.length);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar:  PreferredSize(
          child: AppBar(
            backgroundColor: Color.fromARGB(255, 75, 173, 79),
            bottom: TabBar(
              tabs: tabs,
              controller: tabController,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorColor: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
          preferredSize: Size.fromHeight(50)
        ),
        body: TabBarView(
          controller: tabController,
          children: <Widget>[
            Introduction(content: widget.content,),
            ReplyList(id: widget.content['id'],)
          ],
        ),
      ),
    );
  }
}