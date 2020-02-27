import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import '../widgets/replyItem.dart';
import '../widgets/loading.dart';

class ReplyList extends StatefulWidget {
  final int id;
  ReplyList({Key key,@required this.id}) : super(key: key);

  @override
  _ReplyListState createState() => _ReplyListState();
}

class _ReplyListState extends State<ReplyList> with AutomaticKeepAliveClientMixin {
  List replyList = new List();
  bool ifShow = false;
  bool showToTop = false;

  ScrollController scrollController;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    scrollController = new ScrollController();
    scrollController.addListener((){
      if(scrollController.position.pixels> 500){
        setState(() {
          showToTop = true;
        });
      }else{
        setState(() {
          showToTop = false;
        });
      }
    });
    getReplies(widget.id).then((data){
      setState(() {
        ifShow = false;
        replyList = data;
      });
    });
  }

  @override
  void dispose(){
    scrollController.dispose();
    super.dispose();
  }

  Future getReplies(id) async{
    setState(() {
      ifShow = true;
    });
    Dio dio = new Dio();
    try{
      Response res = await dio.get("https://www.v2ex.com/api/replies/show.json?topic_id=$id");
      return res.data;
    }catch(err){
      print(err);
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Stack(
        children: <Widget>[
          ListView.separated(
            controller: scrollController,
            itemCount: replyList.length,
            itemBuilder: (context,index){
              return Container(
                child: ReplyItem(item: replyList[index],index: index),
              );
            },
            separatorBuilder: (context,index){
              return Divider();
            },
            padding: EdgeInsets.fromLTRB(10.0,15.0,10.0,10.0),
          ),
          Loading(ifShow: ifShow)
        ],
      ),
      floatingActionButton: Opacity(
        opacity: showToTop ? 1 : 0,
        child: FloatingActionButton(
          backgroundColor: Color.fromARGB(255, 255, 235, 59),
          child: Icon(Icons.vertical_align_top,size: 35,),
          onPressed: (){
            scrollController.animateTo(0, duration: Duration(milliseconds: 1000), curve: Curves.easeInCubic);
          }
        )
      )
    );
  }
}