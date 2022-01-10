import 'package:flutter/material.dart';
import 'package:location_specialist/helpers/models/comment/comment.dart';
import 'package:location_specialist/helpers/widgets/comment/comment_list_widget.dart';

class CommentListWaiting extends StatelessWidget {
  final List<Comment> comment;

  const CommentListWaiting({Key? key, required this.comment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return comment == []
        ? CircularProgressIndicator()
        : CommentListWidget(comment: comment);
  }
}
