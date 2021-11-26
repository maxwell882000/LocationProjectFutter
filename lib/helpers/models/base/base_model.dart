class BaseModel {
  late final int id;

  BaseModel.fromJson(Map<String, dynamic> map) {
    this.id = map['id'];
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{'id': this.id};
  }
}
