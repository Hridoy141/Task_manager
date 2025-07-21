class  TaskStatusCountModel {
  late String id;
  late int count;

  TaskStatusCountModel.fromJson(Map<String, dynamic> jsonData){
    id = jsonData ['id'] ?? '';
    count = jsonData ['sum'] ?? '';
  }
}