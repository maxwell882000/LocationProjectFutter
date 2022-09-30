class Request {
  static const String baseUrl = "http://31.44.4.27/";
  final String _url;
  final Map<String, dynamic> data;

  Request(this._url, {this.data = const {}}) {
    print(this._url);
  }

  Uri get url => Uri.parse(baseUrl + _url);

  Uri get emptyUrl => Uri.parse(_url);
}
