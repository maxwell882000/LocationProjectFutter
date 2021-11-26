import 'package:flutter/material.dart';
import 'package:location_specialist/helpers/static/style_handler.dart';
import 'package:location_specialist/helpers/widgets/button/implementations/black-button.dart';
import 'package:location_specialist/helpers/widgets/comment/comment_form.dart';
import 'package:location_specialist/helpers/widgets/label/label_widget.dart';
import 'package:location_specialist/helpers/widgets/scaffold/scaffold_inside.dart';
import 'package:location_specialist/helpers/widgets/text_field/abstracts/base_text_field.dart';
import 'package:location_specialist/pages/category/helper_widgets/category_list_item.dart';
import 'package:location_specialist/pages/specialist/helper_widgets/specialist_item_base.dart';
import 'package:location_specialist/pages/specialist/provider/specialist_view_provider.dart';
import 'package:provider/provider.dart';

class SpecialistView extends StatelessWidget {
  final SpecialistViewProvider provider = new SpecialistViewProvider();
  SpecialistView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldInside(
      body: ChangeNotifierProvider.value(
        value: provider,
        child: ListView(
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
            Text(provider.specialist.user.phone),
            StyleHandler.y_margin,
            Consumer<SpecialistViewProvider>(
                builder: (context, provider, child) {
              return SizedBox();
            }),
            StyleHandler.y_margin,
            CommentForm(
                onSaved: (text) {},
                validatator: (text) => "",
                sendComment: () {})
          ],
        ),
      ),
    );
  }
}
