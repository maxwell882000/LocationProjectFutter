import 'package:flutter/material.dart';
import 'package:location_specialist/helpers/components/providers/comment_provider.dart';
import 'package:location_specialist/helpers/components/widgets/comment_widget.dart';
import 'package:location_specialist/helpers/components/widgets/list_stars.dart';
import 'package:location_specialist/helpers/static/style_handler.dart';
import 'package:location_specialist/helpers/widgets/comment/comment_list_waiting.dart';
import 'package:location_specialist/helpers/widgets/scaffold/scaffold_inside.dart';
import 'package:location_specialist/pages/location/provider/location_comment_provider.dart';
import 'package:location_specialist/pages/location/provider/location_view_provider.dart';
import 'package:location_specialist/pages/specialist/provider/specialist_view_provider.dart';
import 'package:provider/provider.dart';

class LocationComment extends StatelessWidget {
  const LocationComment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LocationCommentProvider>(
      create: (_) => LocationCommentProvider(),
      child: Builder(
        builder: (context) {
          return ScaffoldInside(
            body: Column(
              children: [
                Consumer<LocationCommentProvider>(builder: (context, provider, child) {
                  return CommentListWaiting(comment: provider.location.comments);
                }),
                StyleHandler.y_margin,
                ListStars(
                    repo: Provider.of<LocationCommentProvider>(context, listen: false)),
                StyleHandler.y_margin,
                ChangeNotifierProvider(
                    create: (_) => CommentProvider(
                          Provider.of<LocationCommentProvider>(context, listen: false),
                        ),
                    child: CommentWidget())
              ],
            ),
          );
        }
      ),
    );
  }
}
