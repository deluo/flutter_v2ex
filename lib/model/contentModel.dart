class ContentModel{
  final Map node;
  final Map member;
  final String last_reply_by; // 最新回复
  final String title;
  final int last_modified; // 最新修改时间（时间戳）
  final int replies;
  final int id;
  final String content;


  ContentModel(this.node,this.member,this.last_reply_by,this.title,this.last_modified,this.replies,this.id,
    this.content
  );

  ContentModel.fromJson(Map<String,dynamic> json)
    :node         = json['node'],
    member        = json['member'],
    last_reply_by = json['last_reply_by'],
    title         = json['title'],
    last_modified = json['last_modified'],
    replies       = json['replies'],
    id            = json['id'],
    content       = json['content']
    ;

  Map<String,dynamic> toJson() =>
  {
    'node':node,
    'member':member,
    'last_reply_by':last_reply_by,
    'title':title,
    'last_modified':last_modified,
    'replies':replies,
    'id':id,
    'content':content
  };

}