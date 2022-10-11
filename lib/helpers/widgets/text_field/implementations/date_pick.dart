import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:location_specialist/helpers/widgets/text_field/abstracts/base_text_field.dart';

class DatePick extends BaseTextField {
  DatePick(
      {required Function(String? p1)? onSaved,
      required TextEditingController textEditingController})
      : super(
            controller: textEditingController,
            onSaved: onSaved,
            icon: Icon(
              Icons.calendar_today,
              color: Colors.grey,
            ),
            readOnly: true,
            validatator: (text) {
              return text != null || text == "" ? null : "Обязательное поле";
            },
            hintText: "День рождения",
            onTap: (BuildContext context,
                TextEditingController? controller) async {
              DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: controller?.text == ""
                      ? DateTime.parse("2012-02-27")
                      : DateTime.parse(controller!.text),
                  firstDate: DateTime(1950),
                  lastDate: DateTime(2015));
              if (pickedDate != null) {
                print(
                    pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                String formattedDate =
                    DateFormat('yyyy-MM-dd').format(pickedDate);
                controller!.text = formattedDate;
              }
            });
}
