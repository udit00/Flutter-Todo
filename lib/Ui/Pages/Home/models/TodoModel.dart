class TodoModel {
  int? id;
  String? title;
  String? description;
  int? typeid;
  String? typename;
  String? createdon;
  String? bgcolor;

  TodoModel(
      {this.id,
      this.title,
      this.description,
      this.typeid,
      this.typename,
      this.createdon,
      this.bgcolor});

  TodoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    typeid = json['typeid'];
    typename = json['typename'];
    createdon = json['createdon'];
    bgcolor = json['bgcolor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['typeid'] = this.typeid;
    data['typename'] = this.typename;
    data['createdon'] = this.createdon;
    data['bgcolor'] = this.bgcolor;
    return data;
  }
}
