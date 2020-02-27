import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../model/nodeModel.dart';

class NodeItem extends StatelessWidget {
  final item;
  const NodeItem({Key key,@required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var content = NodeModel.fromJson(item);

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
              // runSpacing: 8.0,
              alignment: WrapAlignment.start,
              children: List.generate(content.subNodes.length, (i)=>SubNodes(node: content.subNodes[i]))
            ),
          )
        ],
      ),
    );
  }
}

class SubNodes extends StatelessWidget {
  final node;
  const SubNodes({Key key,@required this.node}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var subNode = SubNodeModel.fromJson(node);
    return GestureDetector(
      child: Chip(
        backgroundColor: Color.fromRGBO(204, 204, 204, 0.5),
        label: Text("${subNode.title}",textAlign: TextAlign.center,style: TextStyle(color: Color.fromRGBO(102, 102, 102, 1)),),
      ),
      onTap: (){
        print("print this tap"+subNode.name);
      },
    );
  }
}

class SubNodeModel{
  final String name;
  final String title;

  SubNodeModel(this.name,this.title);

  SubNodeModel.fromJson(Map<String,dynamic> json)
    :name = json['name'],
    title = json['title']
    ;

  Map<String,dynamic> toJson() =>
  {
    'name':name,
    'title':title,
  };

}