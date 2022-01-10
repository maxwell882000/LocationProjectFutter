import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location_specialist/helpers/models/comment/comment.dart';
import 'package:location_specialist/helpers/static/style_handler.dart';
import 'package:location_specialist/helpers/widgets/label/label_widget.dart';

class CommentListWidget extends StatelessWidget {
  final List<Comment> comment;
  const CommentListWidget({Key? key, required this.comment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LabelWidget(
      text: "Комментарии:",
      child: SizedBox(
        width: Get.width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: comment.map<Widget>((e) {
            return Flexible(
              child: Container(
                width: Get.width,
                height: 100,
                padding: EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white10,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Flexible(
                          flex: 3,
                          child: Text(
                            e.user.name,
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Flexible(
                            child: Text(
                          e.date,
                          style: TextStyle(fontSize: 12, color: Colors.black38),
                        ))
                      ],
                    ),
                    StyleHandler.y_margin,
                    Expanded(
                        child: Text(
                      e.comment,
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ))
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
