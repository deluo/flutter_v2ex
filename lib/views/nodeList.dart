import 'package:flutter/material.dart';
import '../widgets/nodeItem.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class NodeList extends StatefulWidget {
  NodeList({Key key}) : super(key: key);

  @override
  _NodeListState createState() => _NodeListState();
}

class _NodeListState extends State<NodeList> with AutomaticKeepAliveClientMixin {
  List list = new List();

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    getAllNodes().then((data){
      setState(() {
        list = data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      child: ListView.builder(
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
          return NodeItem(item: list[index],);
        }
      ),
    );
  }

  Future getAllNodes() async{
    Dio dio = new Dio();
    DateTime curTime = new DateTime.now();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.getString('nodeList')!=null && prefs.getString('time')!=null){
      DateTime lastTime = DateTime.parse(prefs.getString('time'));
      if(curTime.difference(lastTime).inDays ==0 && prefs.getString('nodeList')!=null){
        return Future.value(JsonDecoder().convert(prefs.getString('nodeList')));
      }
    }
    try{
      Response res = await dio.get("http://49.51.172.155:3000/api/allnode");
      prefs.setString('time', DateTime.now().toString());
      prefs.setString('nodeList', JsonEncoder().convert(res.data));
      return res.data;
    }catch(err){
      print(err);
    } 
  }
}