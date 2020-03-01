class NodeModel {
  String parentNode;
  List<SubNodes> subNodes;

  NodeModel({this.parentNode, this.subNodes});

  NodeModel.fromJson(Map<String, dynamic> json) {
    parentNode = json['parentNode'];
    if (json['subNodes'] != null) {
      subNodes = new List<SubNodes>();
      json['subNodes'].forEach((v) {
        subNodes.add(new SubNodes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['parentNode'] = this.parentNode;
    if (this.subNodes != null) {
      data['subNodes'] = this.subNodes.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SubNodes {
  String name;
  String title;

  SubNodes({this.name, this.title});

  SubNodes.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['title'] = this.title;
    return data;
  }
}