class Data {
  int id;
  int color;
  String name;
  int commentCount;
  bool shared;
  bool favorite;
  int syncId;
  bool inboxProject;
  String url;

  Data(
      {this.id,
        this.color,
        this.name,
        this.commentCount,
        this.shared,
        this.favorite,
        this.syncId,
        this.inboxProject,
        this.url});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    color = json['color'];
    name = json['name'];
    commentCount = json['comment_count'];
    shared = json['shared'];
    favorite = json['favorite'];
    syncId = json['sync_id'];
    inboxProject = json['inbox_project'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['color'] = this.color;
    data['name'] = this.name;
    data['comment_count'] = this.commentCount;
    data['shared'] = this.shared;
    data['favorite'] = this.favorite;
    data['sync_id'] = this.syncId;
    data['inbox_project'] = this.inboxProject;
    data['url'] = this.url;
    return data;
  }
}
