import 'dart:typed_data';
import 'package:http_parser/http_parser.dart';

class Media {
  final String name;
  final Uint8List bytes;
  final MediaType media;
  const Media({required this.name,required this.bytes, required this.media});
}
