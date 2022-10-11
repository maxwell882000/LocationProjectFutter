import 'package:flutter/material.dart';
import 'package:location_specialist/helpers/static/style_handler.dart';
import 'package:location_specialist/helpers/widgets/button/implementations/black-button.dart';
import 'package:location_specialist/helpers/widgets/button/implementations/red-button.dart';
import 'package:location_specialist/helpers/widgets/image_picker/image-picker-custom.dart';
import 'package:location_specialist/helpers/widgets/loading/widgets/loading.dart';
import 'package:location_specialist/helpers/widgets/text/text_title.dart';
import 'package:location_specialist/helpers/widgets/text_field/abstracts/base_text_field.dart';
import 'package:location_specialist/helpers/widgets/text_field/implementations/date_pick.dart';
import 'package:location_specialist/helpers/widgets/text_field/implementations/text-field-phone.dart';
import 'package:location_specialist/pages/main/providers/user_edit_provider.dart';
import 'package:location_specialist/pages/register/specialist/category-selection.dart';
import 'package:location_specialist/pages/register/specialist/category_client_selection.dart';
import 'package:provider/provider.dart';

class UserEdit extends StatelessWidget {
  UserEdit({Key? key}) : super(key: key);
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<UserEditProvider>(
      create: (_) => UserEditProvider(_),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Form(
          key: _key,
          child: Loading<UserEditProvider>(
            child: Builder(builder: (context) {
              return ListView(
                children: [
                  Align(
                      alignment: Alignment.center,
                      child: TextTitle("Обновить профиль")),
                  StyleHandler.y_margin,
                  StyleHandler.y_margin,
                  if (Provider.of<UserEditProvider>(context).user.specialist !=
                      null)
                    Center(
                      child: ImagePickerCustom(
                        initialImage: Provider.of<UserEditProvider>(context)
                            .user
                            .specialist!
                            .image,
                        onServer:
                            Provider.of<UserEditProvider>(context).setImage,
                        onDelete:
                            Provider.of<UserEditProvider>(context).deleteImage,
                      ),
                    ),
                  StyleHandler.y_margin,
                  Consumer<UserEditProvider>(
                      builder: (context, provider, child) {
                    return BaseTextField(
                        hintText: "Имя",
                        initialValue: provider.user.firstname,
                        validatator: (text) {
                          return text != null || text == ""
                              ? null
                              : "Имя обязательное поле";
                        },
                        onSaved: (text) {
                          provider.name = text!;
                        });
                  }),
                  StyleHandler.y_margin,
                  Consumer<UserEditProvider>(
                      builder: (context, provider, child) {
                    return BaseTextField(
                        hintText: "Фамилия",
                        initialValue: provider.user.lastname,
                        validatator: (text) {
                          return text != null || text == ""
                              ? null
                              : "Фамилия обязательное поле";
                        },
                        onSaved: (text) {
                          provider.lastname = text!;
                        });
                  }),
                  StyleHandler.y_margin,
                  Consumer<UserEditProvider>(
                      builder: (context, provider, child) {
                    return TextFieldPhone(
                        initialValue: provider.user.phone,
                        onSaved: (text) {
                          provider.phone = text!;
                        });
                  }),
                  StyleHandler.y_margin,
                  if (Provider.of<UserEditProvider>(context).user.specialist !=
                      null) ...[
                    StyleHandler.y_margin,
                    BaseTextField(
                        hintText: "Описание",
                        maxLines: 4,
                        initialValue: Provider.of<UserEditProvider>(context)
                            .user
                            .specialist!
                            .description,
                        onSaved: Provider.of<UserEditProvider>(context)
                            .setDescription),
                    StyleHandler.y_margin,
                    BaseTextField(
                        hintText: "Образование",
                        maxLines: 4,
                        initialValue: Provider.of<UserEditProvider>(context)
                            .user
                            .specialist!
                            .education,
                        validatator: (text) {
                          return text != null || text == ""
                              ? null
                              : "Обязательное поле";
                        },
                        onSaved: Provider.of<UserEditProvider>(context)
                            .setEducation),
                    StyleHandler.y_margin,
                    BaseTextField(
                        hintText: "Опыт работы",
                        maxLines: 4,
                        initialValue: Provider.of<UserEditProvider>(context)
                            .user
                            .specialist!
                            .experience,
                        validatator: (text) {
                          return text != null || text == ""
                              ? null
                              : "Обязательное поле";
                        },
                        onSaved: Provider.of<UserEditProvider>(context)
                            .setExperience),
                    StyleHandler.y_margin,
                    Consumer<UserEditProvider>(
                        builder: (context, provider, child) {
                      return RedButton(
                          onPressed: provider.setLocation,
                          text: provider.textOfLocation());
                    }),
                    StyleHandler.y_margin,
                    Consumer<UserEditProvider>(
                        builder: (context, provider, child) {
                      return BaseTextField(
                          hintText: "Вес",
                          initialValue: Provider.of<UserEditProvider>(context)
                              .user
                              .specialist!
                              .weight
                              .toString(),
                          validatator: (text) {
                            return text != null || text == ""
                                ? null
                                : "Вес обязательное поле";
                          },
                          onSaved: provider.setWeight);
                    }),
                    StyleHandler.y_margin,
                    Consumer<UserEditProvider>(
                        builder: (context, provider, child) {
                      return BaseTextField(
                          hintText: "Рост",
                          initialValue: Provider.of<UserEditProvider>(context)
                              .user
                              .specialist!
                              .height
                              .toString(),
                          validatator: (text) {
                            return text != null || text == ""
                                ? null
                                : "Рост обязательное поле";
                          },
                          onSaved: provider.setHeight);
                    }),
                    StyleHandler.y_margin,
                    Consumer<UserEditProvider>(
                      builder: (context, provider, child) {
                        return DatePick(
                            textEditingController: provider.dateController,
                            onSaved: provider.setDate);
                      },
                    ),
                    StyleHandler.y_margin,
                    Consumer<UserEditProvider>(
                        builder: (context, provider, child) {
                      return CategorySelection(
                          category: () => provider.user.specialist!.category
                              .map<String>((e) => e.categoryName)
                              .toList(),
                          onSelect: provider.setCategory);
                    }),
                    StyleHandler.y_margin,
                    Consumer<UserEditProvider>(
                        builder: (context, provider, child) {
                      return CategoryClientSelection(
                        category: () => provider.user.specialist!.clientCategory
                            .map<String>((e) => e.name)
                            .toList(),
                        onSelect: provider.setClientCategories,
                      );
                    }),
                  ],
                  StyleHandler.y_margin,
                  Builder(builder: (context) {
                    return BlackButton(
                      text: "Обновить",
                      onPressed: () {
                        if (_key.currentState!.validate()) {
                          _key.currentState!.save();
                          final provider = Provider.of<UserEditProvider>(
                              context,
                              listen: false);
                          provider.updateProfile(context);
                        }
                      },
                    );
                  })
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
