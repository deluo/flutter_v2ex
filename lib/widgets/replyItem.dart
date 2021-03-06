import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:v2ex_flutter/widgets/webView.dart';
import '../model/replyModel.dart';
import '../utils/date.dart';

class ReplyItem extends StatelessWidget {
  final item;
  final index;

  const ReplyItem({Key key, @required this.item, @required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var content = ReplyModel.fromJson(item);

    String timeDiff = getTimeDiff(content.last_modified * 1000);

    return Container(
      alignment: Alignment.topLeft,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: CircleAvatar(
              backgroundImage:
                  NetworkImage("https:" + content.member['avatar_normal']),
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
                              child: Text(content.member['username'],
                                  style: TextStyle(
                                      fontSize: 12,
                                      color:
                                          Color.fromARGB(225, 122, 122, 122))),
                              margin: EdgeInsets.only(right: 8.0),
                            ),
                            // Container(
                            //   child: Text('♥',style: TextStyle(fontSize: 11,color: Color.fromARGB(225, 102, 102, 102))),
                            //   decoration: BoxDecoration(
                            //     border: Border.all(color: Color.fromARGB(205, 110, 110, 110),width: 1),
                            //     borderRadius: BorderRadius.circular(3.0),
                            //   ),
                            //   padding: EdgeInsets.fromLTRB(2, 0, 2, 1),
                            // )
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          children: <Widget>[
                            // Icon(Icons.chat_bubble_outline,size: 13,color: Color.fromARGB(255, 102, 102, 102),),
                            Text(
                              (index + 1).toString() + '楼',
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Color.fromARGB(255, 102, 102, 102)),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 0,
                  child: MarkdownBody(
                    data: content.content,
                    styleSheet: MarkdownStyleSheet(
                      h1: TextStyle(
                          fontSize: 18.0,
                          color: Color.fromARGB(225, 51, 51, 51),
                          fontWeight: FontWeight.bold),
                      h2: TextStyle(
                          fontSize: 17.0,
                          color: Color.fromARGB(225, 51, 51, 51),
                          fontWeight: FontWeight.bold),
                      h3: TextStyle(
                          fontSize: 16.0,
                          color: Color.fromARGB(225, 51, 51, 51),
                          fontWeight: FontWeight.bold),
                      h4: TextStyle(
                          fontSize: 15.0,
                          color: Color.fromARGB(225, 51, 51, 51),
                          fontWeight: FontWeight.bold),
                      h5: TextStyle(
                          fontSize: 14.0,
                          color: Color.fromARGB(225, 51, 51, 51),
                          fontWeight: FontWeight.bold),
                    ),
                    onTapLink: (url) => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => Browser(url: url),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 4),
                  child: Text(
                    "$timeDiff",
                    style: TextStyle(
                      color: Color.fromARGB(255, 174, 174, 174),
                      fontSize: 13,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
