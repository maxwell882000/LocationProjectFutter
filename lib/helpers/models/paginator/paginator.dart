abstract class Paginator<T> {
  late final String next;
  late bool loading = false;
  late final List<T> list;

  void setLoading() {
    loading = true;
  }

  Paginator() {
    this.next = "";
    this.list = [];
  }
  Paginator.fromJson(Map<String, dynamic> map) {
    this.next = map['next'] ?? "";
    this.list = results(map);
  }
  List<T> results(Map<String, dynamic> map);
}
