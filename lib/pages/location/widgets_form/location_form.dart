import 'package:flutter/material.dart';
import 'package:location_specialist/helpers/static/style_handler.dart';
import 'package:location_specialist/helpers/widgets/button/implementations/black-button.dart';
import 'package:location_specialist/helpers/widgets/check_box/check-box-helper.dart';
import 'package:location_specialist/helpers/widgets/image_picker/image-multiple-custom.dart';
import 'package:location_specialist/helpers/widgets/loading/widgets/loading.dart';
import 'package:location_specialist/helpers/widgets/scaffold/scaffold_inside.dart';
import 'package:location_specialist/helpers/widgets/scaffold/scaffold_main.dart';
import 'package:location_specialist/helpers/widgets/text/text_title.dart';
import 'package:location_specialist/helpers/widgets/text_field/abstracts/base_text_field.dart';
import 'package:location_specialist/pages/location/provider/location_form_provider.dart';
import 'package:location_specialist/pages/location/widgets_form/country_city_drop_down.dart';
import 'package:location_specialist/pages/location/widgets_form/map_location_form.dart';
import 'package:provider/provider.dart';

class LocationForm extends StatelessWidget {
  LocationForm({Key? key}) : super(key: key);
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return ScaffoldInside(
      body: ChangeNotifierProvider<LocationFormProvider>(
        create: (_) => LocationFormProvider(),
        child: Builder(builder: (context) {
          return Loading<LocationFormProvider>(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                StyleHandler.y_margin,
                TextTitle("Добавить Локацию"),
                StyleHandler.y_margin,
                Flexible(
                    child: Form(
                  key: _key,
                  child: ListView(
                    children: [
                      Consumer<LocationFormProvider>(
                          builder: (context, provider, child) {
                        return ImageMultipleCustom(
                          onDelete: provider.deleteImage,
                          onServer: provider.setImage,
                          validation:provider.setOverallNumber,
                        );
                      }),
                      StyleHandler.y_margin,
                      CountryCityDropDown(),
                      StyleHandler.y_margin,
                      BaseTextField(
                          hintText: "Район",
                          onSaved: (text) {
                            Provider.of<LocationFormProvider>(context,
                                    listen: false)
                                .setLocations("district", text);
                          }),
                      StyleHandler.y_margin,
                      CheckBoxHelper(
                          onPressed: (isChecked) {
                            Provider.of<LocationFormProvider>(context,
                                    listen: false)
                                .setLocations("parking", isChecked);
                          },
                          hintText: "Парковка"),
                      CheckBoxHelper(
                          onPressed: (isChecked) {
                            Provider.of<LocationFormProvider>(context,
                                    listen: false)
                                .setLocations("function_less", isChecked);
                          },
                          hintText: "Доступность для малообильных людей"),
                      StyleHandler.y_margin,
                      BaseTextField(
                          hintText: "Описание",
                          maxLines: 3,
                          onSaved: (text) {
                            Provider.of<LocationFormProvider>(context,
                                    listen: false)
                                .setLocations("description", text);
                          }),
                      StyleHandler.y_margin,
                      BaseTextField(
                          hintText: "Удобства",
                          maxLines: 3,
                          onSaved: (text) {
                            Provider.of<LocationFormProvider>(context,
                                    listen: false)
                                .setLocations("comfort", text);
                          }),
                      StyleHandler.y_margin,
                      MapLocationForm(onSelect: (lat) {
                        Provider.of<LocationFormProvider>(context,
                                listen: false)
                            .setCoordinates(lat);
                      }),
                      StyleHandler.y_margin,
                      BlackButton(
                        text: "Добавить",
                        onPressed: () {
                          if (_key.currentState!.validate()) {
                            _key.currentState!.save();
                            Provider.of<LocationFormProvider>(context,
                                    listen: false)
                                .submit();
                          }
                        },
                      ),
                    ],
                  ),
                ))
              ],
            ),
          );
        }),
      ),
    );
  }
}