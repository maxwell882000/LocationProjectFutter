import 'package:flutter/material.dart';
import 'package:location_specialist/helpers/models/category/client_category.dart';
import 'package:location_specialist/helpers/widgets/button/implementations/black-button.dart';
import 'package:location_specialist/helpers/widgets/button/implementations/red-button.dart';
import 'package:location_specialist/helpers/widgets/image_picker/image-picker-custom.dart';
import 'package:location_specialist/helpers/widgets/scaffold/scaffold_auth.dart';
import 'package:location_specialist/helpers/widgets/text_field/abstracts/base_text_field.dart';
import 'package:location_specialist/helpers/widgets/text_field/implementations/date_pick.dart';
import 'package:location_specialist/pages/register/providers/specialist_register_provider.dart';
import 'package:location_specialist/pages/register/specialist/category-selection.dart';
import 'package:location_specialist/pages/register/specialist/category_client_selection.dart';
import 'package:provider/provider.dart';

class SpecialistRegister extends StatelessWidget {
  SpecialistRegister({Key? key}) : super(key: key);
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SpecialistRegisterProvider>(
      create: (_) => SpecialistRegisterProvider(),
      child: Form(
        key: formkey,
        child: Builder(builder: (context) {
          return ScaffoldAuth<SpecialistRegisterProvider>(children: [
            ImagePickerCustom(
              onServer: SpecialistRegisterProvider.provider(context).setImage,
              onDelete:
                  SpecialistRegisterProvider.provider(context).deleteImage,
            ),
            BaseTextField(
                hintText: "Описание",
                validatator: (text) {
                  return text != null || text == ""
                      ? null
                      : "Обязательное поле";
                },
                maxLines: 4,
                onSaved: SpecialistRegisterProvider.provider(context)
                    .setDescription),
            BaseTextField(
                hintText: "Образование",
                maxLines: 4,
                validatator: (text) {
                  return text != null || text == ""
                      ? null
                      : "Обязательное поле";
                },
                onSaved:
                    SpecialistRegisterProvider.provider(context).setEducation),
            BaseTextField(
                hintText: "Опыт работы",
                maxLines: 4,
                validatator: (text) {
                  return text != null || text == ""
                      ? null
                      : "Обязательное поле";
                },
                onSaved:
                    SpecialistRegisterProvider.provider(context).setExperience),
            Consumer<SpecialistRegisterProvider>(
                builder: (context, provider, child) {
              return RedButton(
                  onPressed: provider.setLocation,
                  text: provider.textOfLocation());
            }),
            Consumer<SpecialistRegisterProvider>(
                builder: (context, provider, child) {
              return BaseTextField(
                  hintText: "Вес",
                  keyboardType: TextInputType.number,
                  validatator: (text) {
                    return text != null || text == ""
                        ? null
                        : "Вес обязательное поле";
                  },
                  onSaved: provider.setWeight);
            }),
            Consumer<SpecialistRegisterProvider>(
                builder: (context, provider, child) {
              return BaseTextField(
                  hintText: "Рост",
                  keyboardType: TextInputType.number,
                  validatator: (text) {
                    return text != null || text == ""
                        ? null
                        : "Рост обязательное поле";
                  },
                  onSaved: provider.setHeight);
            }),
            Consumer<SpecialistRegisterProvider>(
              builder: (context, provider, child) {
                return DatePick(
                    textEditingController: provider.editingController,
                    onSaved: provider.setDateOfBirth);
              },
            ),
            // Row(
            //   children: [
            //     Text("Не нашли локацию ?"),
            //     CheckBoxCustom(onPressed: (val) {
            //       SpecialistRegisterProvider
            //           .provider(context)
            //           .customLocation = val;
            //     }),
            //   ],
            // ),
            // Consumer<SpecialistRegisterProvider>(
            //     builder: (context,provider, child) {
            //       return Visibility(
            //         visible: provider.customLocation,
            //         child: child!
            //       );
            //     },
            //   child: BaseTextField(
            //     onSaved: SpecialistRegisterProvider
            //         .provider(context)
            //         .setCustomLocation,
            //     hintText: "Введите локацию",
            //   ),
            // ),
            CategorySelection(
                onSelect:
                    SpecialistRegisterProvider.provider(context).setCategory),
            CategoryClientSelection(
              onSelect: SpecialistRegisterProvider.provider(context)
                  .setClientCategory,
            ),
            BlackButton(
              text: "ЗАРЕГИСТРИРОВАТЬСЯ",
              onPressed: () {
                if (formkey.currentState!.validate()) {
                  formkey.currentState!.save();
                  final provider = SpecialistRegisterProvider.provider(context);
                  provider.registerSpecialist();
                }
              },
            )
          ]);
        }),
      ),
    );
  }
}
