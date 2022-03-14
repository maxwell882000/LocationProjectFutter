import 'package:flutter/material.dart';
import 'package:location_specialist/helpers/components/providers/comment_provider.dart';
import 'package:location_specialist/helpers/components/widgets/comment_widget.dart';
import 'package:location_specialist/helpers/components/widgets/list_stars.dart';
import 'package:location_specialist/helpers/static/style_handler.dart';
import 'package:location_specialist/helpers/widgets/comment/comment_list_waiting.dart';
import 'package:location_specialist/helpers/widgets/label/label_widget.dart';
import 'package:location_specialist/helpers/widgets/scaffold/scaffold_inside.dart';
import 'package:location_specialist/pages/category/helper_widgets/category_list_item.dart';
import 'package:location_specialist/pages/specialist/helper_widgets/specialist_item_base.dart';
import 'package:location_specialist/pages/specialist/provider/specialist_view_provider.dart';
import 'package:location_specialist/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class SpecialistView extends StatelessWidget {
  final SpecialistViewProvider provider = new SpecialistViewProvider();
  SpecialistView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldInside(
      body: ChangeNotifierProvider<SpecialistViewProvider>.value(
        value: provider,
        child: Builder(builder: (context) {
          return ListView(
            children: [
              SpecialistItemBase(specialist: provider.specialist),
              StyleHandler.y_margin,
              LabelWidget(
                  text: "Виды деятельности:",
                  child: CategoryListItem(
                    categories: provider.specialist.category,
                  )),
              StyleHandler.y_margin,
              LabelWidget(
                  text: "Описание:",
                  child: Text(
                    provider.specialist.description,
                  )),
              StyleHandler.y_margin,
              LabelWidget(
                  text: "Номер телефона:",
                  child: Text(provider.specialist.user.phone)),
              StyleHandler.y_margin,
              Consumer<SpecialistViewProvider>(
                  builder: (context, provider, child) {
                return CommentListWaiting(
                    comment: provider.specialist.comments);
              }),
              if (Provider.of<AuthProvider>(context,listen: false)
              .user?.specialist == null ||
                  Provider.of<SpecialistViewProvider>(context, listen: false)
                  .specialist.id != Provider.of<AuthProvider>(context, listen: false)
                          .user
                          ?.specialist!
                          .id) ...[
                StyleHandler.y_margin,
                ListStars(repo: provider),
                StyleHandler.y_margin,
                ChangeNotifierProvider(
                    create: (_) => CommentProvider(
                          provider,
                        ),
                    child: CommentWidget())
              ]
            ],
          );
        }),
      ),
    );
  }
}
