class ReplyModel{
  final Map member;
  final int created; 
  final int topic_id;
  final String content;
  final String content_rendered;
  final int last_modified;
  final int member_id;
  final int id;


  ReplyModel(this.member,this.created,this.topic_id,this.content,this.last_modified,this.content_rendered,this.id,this.member_id);

  ReplyModel.fromJson(Map<String,dynamic> json)
    :created         = json['created'],
    member           = json['member'],
    topic_id         = json['topic_id'],
    content          = json['content'],
    content_rendered = json['content_rendered'],
    last_modified    = json['last_modified'],
    member_id        = json['member_id'],
    id               = json['id']
    ;

  Map<String,dynamic> toJson() =>
  {
    'created':created,
    'member':member,
    'topic_id':topic_id,
    'content':content,
    'content_rendered':content_rendered,
    'last_modified':last_modified,
    'member_id':member_id,
    'id':id
  };

}