import 'package:flutter/material.dart';
import '../views/contentDetail.dart';
import '../widgets/contentItem.dart';
import 'package:dio/dio.dart';
import '../widgets/loading.dart';

class MsgList extends StatefulWidget {
  MsgList({Key key}) : super(key: key);

  @override
  _MsgListState createState() => _MsgListState();
}

class _MsgListState extends State<MsgList> with AutomaticKeepAliveClientMixin {
  Future _future;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _future = getMsgList();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return RefreshIndicator(
      child:FutureBuilder(
        future: _future,
        builder: _futureBuilder,
      ),
      onRefresh: ()async{
       _future = getMsgList();
      },
    );
  }

  Widget _futureBuilder(BuildContext context,AsyncSnapshot snapshot){
    if(snapshot.connectionState == ConnectionState.done){
      return ListView.separated(
        itemCount: snapshot.data.length,
        itemBuilder: (context,index){
          return GestureDetector(
            child: ContentItem(item: snapshot.data[index]),
            behavior: HitTestBehavior.opaque,
            onTap: (){
              Navigator.push(context,MaterialPageRoute(
                builder: (context){
                  return ContentDetail(content: snapshot.data[index],);
                }
              ));
            },
          );
        },
        separatorBuilder: (context,index){
          return Divider(
            height: 5.0,
            indent: 50.0,
            color: Color.fromARGB(255, 205, 205, 205),
          );
        },
        padding: EdgeInsets.fromLTRB(10.0,15.0,10.0,10.0),
      );
    }else{
      return Loading(ifShow: true);
    }
  }

  /*
   * 查询最热帖子列表
   */
  Future getMsgList() async{
    Dio dio = new Dio();
    Response res = await dio.get("https://www.v2ex.com/api/topics/hot.json");
    return res.data;
  }

}