import 'package:flutter/material.dart';
import './views/contentList.dart';
import './views/msgList.dart';
import './views/nodeList.dart';

void main() =>runApp(Home());

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin  {
  final List<Tab> tabs = <Tab>[
    Tab(text: '全部',),
    Tab(text: '最热',),
    Tab(text: '节点',)
  ];
  
  TabController tabController;
  
  @override
  void initState() {
    super.initState();
    tabController = new TabController(vsync: this,length: tabs.length);
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
      theme: ThemeData(
        platform: TargetPlatform.iOS
      ),
      title: "v2ex",
      home: Scaffold(
        appBar: AppBar(title: Text("V2EX",style: TextStyle(color: Color.fromARGB(255, 36, 36, 6)),),centerTitle: true,
          backgroundColor: Color.fromARGB(255, 255, 235, 59),
          bottom: TabBar(
            tabs: tabs,
            controller: tabController,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorColor: Color.fromARGB(255, 0, 0, 0),
            labelColor: Color.fromARGB(255, 34, 31, 8),
            labelStyle: TextStyle(fontWeight: FontWeight.w700),
          ),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.search), onPressed: (){},padding: EdgeInsets.only(right: 10.0),)
          ],
        ),
        body: TabBarView(
          controller: tabController,
          children: <Widget>[
            ContentList(),
            MsgList(),
            NodeList()
          ],
        )
      ),
    );
  }
}