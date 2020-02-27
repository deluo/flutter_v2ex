import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../model/contentModel.dart';
import '../utils/date.dart';

class Introduction extends StatefulWidget {
  final content;
  Introduction({Key key,this.content}) : super(key: key);

  @override
  _IntroductionState createState() => _IntroductionState();
}

class _IntroductionState extends State<Introduction> {
  @override
  Widget build(BuildContext context) {
    ContentModel content = ContentModel.fromJson(widget.content);

    String timeDiff = getTimeDiff(content.last_modified*1000);

    return Container(
      margin: EdgeInsets.only(top: 10.0),
      padding: EdgeInsets.all(8.0),
       child: CustomScrollView(
         slivers: <Widget>[
           SliverList(
             delegate: SliverChildListDelegate(
               [
                  Column(children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          child: CircleAvatar(
                            backgroundImage: NetworkImage("https:"+content.member['avatar_normal']),
                          ),
                          margin: EdgeInsets.only(right: 10.0),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Container(
                                      height: 25.0,
                                      alignment: Alignment.center,
                                      child: Row(
                                        children: <Widget>[
                                          Container(
                                            child: Text(content.member['username'],style: TextStyle(fontSize: 12,color: Color.fromARGB(225, 122, 122, 122))),
                                            margin: EdgeInsets.only(right: 8.0),
                                          ),
                                          Container(
                                            child: Text(content.node['title'],style: TextStyle(fontSize: 11,color: Color.fromARGB(225, 102, 102, 102))),
                                            decoration: BoxDecoration(
                                              border: Border.all(color: Color.fromARGB(205, 110, 110, 110),width: 1),
                                              borderRadius: BorderRadius.circular(3.0),
                                            ),
                                            padding: EdgeInsets.fromLTRB(2, 0, 2, 1),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      child: Row(
                                        children: <Widget>[
                                          Icon(Icons.chat_bubble_outline,size: 13,color: Color.fromARGB(255, 102, 102, 102),),
                                          Text(content.replies.toString(),style: TextStyle(fontSize: 12,color: Color.fromARGB(255, 102, 102, 102)),)
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 0,
                                child: Text(content.title,
                                  // maxLines: 2,
                                  // overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontSize: 15,color: Color.fromARGB(225, 51, 51, 51),fontWeight: FontWeight.w500)
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 4),
                                child: Text("$timeDiff",style: TextStyle(color: Color.fromARGB(255, 174, 174, 174),fontSize: 13)),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Container(
                      // margin: EdgeInsets.only(top: 1),
                      child: Divider()
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(8, 2, 4, 10),
                      child: Text(content.content,
                        textAlign: TextAlign.justify,
                        style: TextStyle(fontSize: 15,color: Color.fromARGB(225, 51, 51, 51),fontWeight: FontWeight.w500,)
                      ),
                    ),
                  ],
                ),
              ]
             )
           ),
         ], 
       )
    );
  }
}