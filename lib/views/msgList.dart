import 'package:flutter/material.dart';
import '../views/contentDetail.dart';
import '../widgets/contentItem.dart';
import 'package:dio/dio.dart';
import '../widgets/loading.dart';

void main()=> runApp(MsgList());

class MsgList extends StatefulWidget {
  MsgList({Key key}) : super(key: key);

  @override
  _MsgListState createState() => _MsgListState();
}

class _MsgListState extends State<MsgList> with AutomaticKeepAliveClientMixin {
  List itemList = new List();
  bool ifShow = false;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    getMsgList().then((data){
      setState(() {
        ifShow = false;
        itemList = data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return RefreshIndicator(
      child:Stack(
        children: <Widget>[
           ListView.separated(
            itemCount: itemList.length,
            itemBuilder: (context,index){
              return GestureDetector(
                child: ContentItem(item: itemList[index]),
                behavior: HitTestBehavior.opaque,
                onTap: (){
                  Navigator.push(context,MaterialPageRoute(
                    builder: (context){
                      return ContentDetail(content: itemList[index],);
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
          ),
          Loading(ifShow: ifShow)
        ],
      ),
      onRefresh: ()async{
        getMsgList().then((data){
          setState(() {
            ifShow = false;
            itemList = data;
          });
        });
      },
    );
  }

  /*
   * 查询最热帖子列表
   */
  Future getMsgList() async{
    setState(() {
      ifShow = true;
    });
    Dio dio = new Dio();
    try{
      Response res = await dio.get("https://www.v2ex.com/api/topics/hot.json");
      return res.data;
    }catch(err){
      print(err);
    }
  }

}