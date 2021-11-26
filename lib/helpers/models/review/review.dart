import 'package:flutter/material.dart';
import 'package:location_specialist/helpers/interface/serialize_json_interface.dart';
import 'package:location_specialist/helpers/models/user/user.dart';

class Review implements SerializeJsonInterface {
  final int review;
  final int user;

  const Review({required this.review, required this.user});
  /* Review.fromJson(Map<String, dynamic> map) {
    this.review = map['review'];
    this.user = map['user'];
  } */

  Map<String, dynamic> toJson() {
    return <String, dynamic>{"review": this.review, 'user': this.user};
  }
}
