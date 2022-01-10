import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location_specialist/helpers/models/specialist/specialist.dart';
import 'package:location_specialist/helpers/static/style_handler.dart';
import 'package:location_specialist/helpers/widgets/button/implementations/black-button.dart';
import 'package:location_specialist/helpers/widgets/comment/comment_form.dart';
import 'package:location_specialist/helpers/widgets/future_widget/future_widget.dart';
import 'package:location_specialist/helpers/widgets/image/image_add.dart';
import 'package:location_specialist/helpers/widgets/label/label_widget.dart';
import 'package:location_specialist/helpers/widgets/scaffold/scaffold_inside.dart';
import 'package:location_specialist/helpers/widgets/scaffold/scaffold_main.dart';
import 'package:location_specialist/helpers/widgets/slider/custom_slider.dart';
import 'package:location_specialist/helpers/widgets/text/text_key_value.dart';
import 'package:location_specialist/helpers/widgets/text/text_title.dart';
import 'package:location_specialist/pages/category/helper_widgets/category_list_item.dart';
import 'package:location_specialist/pages/location/provider/location_view_provider.dart';
import 'package:location_specialist/pages/specialist/helper_widgets/specialist_future_list.dart';
import 'package:location_specialist/routes/path.dart';
import 'package:provider/provider.dart';

class LocationView extends StatelessWidget {
  final LocationProviderView provider = new LocationProviderView();
  LocationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    provider.initAsync();
    return ScaffoldInside(
        body: ChangeNotifierProvider<LocationProviderView>.value(
      value: provider,
      child: ListView(
        children: [
          LabelWidget(
              text: provider.location.name,
              child: CustomSlider(
                  items: provider.location.images
                      .map<Widget>((e) => ImageAdd(
                          path: e.images,
                          size: double.infinity,
                          indicatorSize: 50))
                      .toList())),
          StyleHandler.y_margin,
          LabelWidget(
              text: "Описание Локации:",
              child: Text(
                provider.location.description,
                textAlign: TextAlign.left,
              )),
          StyleHandler.y_margin,
          if (provider.location.category.isNotEmpty)
            LabelWidget(
                text: "Виды деятельности:",
                child: CategoryListItem(
                  categories: provider.location.category,
                )),
          StyleHandler.y_margin,
          TextKeyValue(
              keyText: "Парковка:",
              value: provider.location.parking ? "ДА" : "Нет"),
          TextKeyValue(keyText: "Удобства:", value: provider.location.comfort),
          TextKeyValue(
              keyText: "Доступность для маломобильных людей:",
              value: provider.location.functionLess ? "ДА" : "Нет"),
          StyleHandler.y_margin,
          BlackButton(
            text: "Комментарии",
            onPressed: () {
              Get.toNamed(Path.LOCATION_COMMENT, arguments: provider.location);
            },
          ),
          StyleHandler.y_margin,
          LabelWidget(
            text: "Специалисты",
            child: SpecialistFutureList(
              request: provider.specialist(),
            ),
          ),

          /*   FutureProvider<List<Specialist>>(
            create: (_)=>,
             initialData: initialData)(
              child: Consumer<LocationProviderView>(
                builder: (context, provider, child) {
                  return Column(
                    children: provider.location.specialist
                        .map<Widget>((e) => SpecialistItem(specialist: e))
                        .toList(),
                  );
                },
              ),
              request: provider.initAsync()) */
        ],
      ),
    ));
  }
}
