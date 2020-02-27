class NodeModel{
  final String parentNode;
  final List subNodes;

  NodeModel(this.parentNode,this.subNodes);

  NodeModel.fromJson(Map<String,dynamic> json)
    :parentNode  = json['parentNode'],
    subNodes     = json['subNodes']
    ;

  Map<String,dynamic> toJson() =>
  {
    'parentNode':parentNode,
    'subNodes':subNodes,
  };

}