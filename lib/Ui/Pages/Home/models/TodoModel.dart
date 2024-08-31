class TodoModel {
  int? todoid;
  String? title;
  String? description;
  int? userid;
  String? createdon;
  int? todotypeid;
  String? target;
  int? typeid;
  String? typename;
  int? createid;

  TodoModel(
      {this.todoid,
        this.title,
        this.description,
        this.userid,
        this.createdon,
        this.todotypeid,
        this.target,
        this.typeid,
        this.typename,
        this.createid});

  TodoModel.fromJson(Map<String, dynamic> json) {
    todoid = json['todoid'];
    title = json['title'];
    description = json['description'];
    userid = json['userid'];
    createdon = json['createdon'];
    todotypeid = json['todotypeid'];
    target = json['target'];
    typeid = json['typeid'];
    typename = json['typename'];
    createid = json['createid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['todoid'] = this.todoid;
    data['title'] = this.title;
    data['description'] = this.description;
    data['userid'] = this.userid;
    data['createdon'] = this.createdon;
    data['todotypeid'] = this.todotypeid;
    data['target'] = this.target;
    data['typeid'] = this.typeid;
    data['typename'] = this.typename;
    data['createid'] = this.createid;
    return data;
  }
}
