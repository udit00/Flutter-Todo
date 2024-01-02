class LoginUserModel {
  int? status;
  String? message;
  int? userid;
  String? name;
  String? pass;
  String? displaypicture;
  String? ispremium;
  String? createdon;
  String? fbtoken;
  String? emailId;
  String? mobileNo;

  LoginUserModel(
      {this.status,
      this.message,
      this.userid,
      this.name,
      this.pass,
      this.displaypicture,
      this.ispremium,
      this.createdon,
      this.fbtoken,
      this.emailId,
      this.mobileNo});

  LoginUserModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    userid = json['userid'];
    name = json['name'];
    pass = json['pass'];
    displaypicture = json['displaypicture'];
    ispremium = json['ispremium'];
    createdon = json['createdon'];
    fbtoken = json['fbtoken'];
    emailId = json['email_id'];
    mobileNo = json['mobile_no'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['userid'] = this.userid;
    data['name'] = this.name;
    data['pass'] = this.pass;
    data['displaypicture'] = this.displaypicture;
    data['ispremium'] = this.ispremium;
    data['createdon'] = this.createdon;
    data['fbtoken'] = this.fbtoken;
    data['email_id'] = this.emailId;
    data['mobile_no'] = this.mobileNo;
    return data;
  }
}
