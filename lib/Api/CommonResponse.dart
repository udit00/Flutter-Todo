class CommonResponse {
  late String message;
  late int status;
  late bool success;
  late List<dynamic> data;

  CommonResponse({required this.message, required this.status, required this.success, required this.data});

  CommonResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    success = json['success'];
    // List<dynamic> rawData = json['data'].entries.first.value[0].entries.map().toList();
    // data = json['data'][0].entries.map((entry) => ()).toList();
    data = json['data'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = message;
    data['status'] = status;
    data['success'] = success;
    data['data'] = data;
    return data;
  }
}
