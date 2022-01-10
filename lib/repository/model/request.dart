class Request {
  static const String baseUrl = "http://31.44.4.27/";
  final String _url;
  final Map<String,dynamic> data;

  const Request(this._url, {this.data = const {}});

  Uri get url => Uri.parse(baseUrl + _url);
  Uri get emptyUrl => Uri.parse(_url);
}
