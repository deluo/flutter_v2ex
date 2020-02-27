import 'package:flutter/material.dart';

class MsgItem extends StatelessWidget {
  const MsgItem({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: CircleAvatar(
              backgroundImage: NetworkImage("https://cdn.v2ex.com/avatar/659a/db49/34471_mini.png?m=1579183641"),
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
                              child: Text("David",style: TextStyle(fontSize: 12,color: Color.fromARGB(225, 122, 122, 122))),
                              margin: EdgeInsets.only(right: 8.0),
                            ),
                            Container(
                              child: Text("分享创造",style: TextStyle(fontSize: 12,color: Color.fromARGB(225, 102, 102, 102))),
                              decoration: BoxDecoration(
                                border: Border.all(color: Color.fromARGB(205, 122, 122, 122),width: 1),
                                borderRadius: BorderRadius.circular(3.0),
                              ),
                              padding: EdgeInsets.fromLTRB(2, 1, 2, 2),
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.chat_bubble_outline,size: 13,color: Color.fromARGB(255, 102, 102, 102),),
                            Text("12",style: TextStyle(fontSize: 12,color: Color.fromARGB(255, 102, 102, 102)),)
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 0,
                  child: Text("用双拼的通知，你们打字速度快了吗,用双拼的通知，你们打字速度快了吗,用双拼的通知，你们打字速度快了吗",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 15,color: Color.fromARGB(225, 51, 51, 51),fontWeight: FontWeight.w500)
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 4),
                  child: Text("34分前 最后回复 stanley",style: TextStyle(color: Color.fromARGB(255, 174, 174, 174),fontSize: 13)),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}