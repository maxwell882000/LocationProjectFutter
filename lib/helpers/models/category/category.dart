class Category {
  late String categoryName;
  Category.fromJson(Map<String, dynamic> map) {
    this.categoryName = map["category_name"];
  }
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      "category_name":this.categoryName
    };
  }
}
