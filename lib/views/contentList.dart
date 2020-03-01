import 'package:flutter/material.dart';
import './contentDetail.dart';
import '../widgets/contentItem.dart';
import 'package:dio/dio.dart';
import '../widgets/loading.dart';

class ContentList extends StatefulWidget {
  final String url;
  ContentList({Key key,@required this.url}) : super(key: key);

  @override
  _ContentListState createState() => _ContentListState();
}

class _ContentListState extends State<ContentList> with AutomaticKeepAliveClientMixin {
  Future _future;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _future = getContentList();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return RefreshIndicator(
      child: FutureBuilder(
        future: _future,
        builder: _futureBuilder
      ),
      onRefresh: ()async{
        _future = getContentList();
      },
    );
  }

  Widget _futureBuilder(BuildContext context,AsyncSnapshot snapshot) {
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
    }else {
      return Loading(ifShow: true);
    }
  }

  /*
   * 查询当日最新帖子列表
   */
  Future<List> getContentList() async{
    Dio dio = new Dio();
    // https://www.v2ex.com/api/topics/latest.json
    Response res = await dio.get(widget.url);
    print(res.data);
    return res.data;
  }

}