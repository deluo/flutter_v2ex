import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:v2ex_flutter/views/contentList.dart';
import '../model/nodeModel.dart';

void main()=>runApp(NodeItem(item: null));

class NodeItem extends StatefulWidget {
  final item;
  const NodeItem({Key key,@required this.item}) : super(key: key);

  @override
  _NodeListState createState() => _NodeListState();

}

class _NodeListState extends State<NodeItem> with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    var content = NodeModel.fromJson(widget.item);

    return Container(
      child: Column(
        children: <Widget>[
          Container(
            height: 40.0,
            alignment: Alignment.centerLeft,
            child: Text('${content.parentNode}',style: TextStyle(fontSize: 16,color: Color.fromRGBO(51, 51, 51, 1),fontWeight: FontWeight.w500),),
            padding: EdgeInsets.only(left: 15),
            decoration: BoxDecoration(color: Color.fromRGBO(245, 245, 245, 1)),
          ),
          Container(
            padding: EdgeInsets.only(left: 10,right: 10),
            child: Wrap(
                spacing: 10.0,
                alignment: WrapAlignment.start,
                children: content.subNodes.asMap().entries.map((i)=>ActionChip(
                    backgroundColor: Color.fromRGBO(204, 204, 204, 0.5),
                    label: Text("${i.value.title}",textAlign: TextAlign.center,style: TextStyle(color: Color.fromRGBO(102, 102, 102, 1)),),
                    onPressed:(){
                      String url = 'https://www.v2ex.com/api/topics/show.json?node_name='+i.value.name;
                      Navigator.push(context,MaterialPageRoute(
                          builder: (context){
                            return ContentList(url: url,title:i.value.title);
                          }
                      ),);
                    },
                  ),).toList()
            ),
          )
        ],
      ),
    );
  }
}