import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:location_specialist/helpers/static/style_handler.dart';
import 'package:location_specialist/helpers/widgets/button/implementations/red-button.dart';
import 'package:location_specialist/helpers/widgets/scaffold/scaffold_inside.dart';
import 'package:location_specialist/helpers/widgets/text_field/abstracts/base_text_field.dart';
import 'package:location_specialist/helpers/widgets/text_field/formater/card_formatter.dart';
import 'package:location_specialist/helpers/widgets/text_field/formater/day_payment_formatter.dart';
import 'package:location_specialist/routes/path.dart';

class Payment extends StatelessWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldInside(
        bottomSheet: Padding(
          padding: EdgeInsets.all(20),
          child: RedButton(
            text: "Оплатить",
            onPressed: () {},
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset("assets/images/logo.svg"),
            StyleHandler.y_margin,
            StyleHandler.y_margin,
            StyleHandler.y_margin,
            BaseTextField(
                maxLength: 19,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  CardFormatter(),
                ],
                hintText: "Номер карты",
                onSaved: (text) {}),
            StyleHandler.y_margin,
            Row(
              children: [
                Expanded(
                    child: BaseTextField(
                        inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      DatePaymentFormatter()
                    ],
                        hintText: "Срок действия",
                        maxLength: 5,
                        onSaved: (text) {})),
                StyleHandler.x_margin,
                Expanded(
                  child: BaseTextField(
                    onSaved: (text) {},
                    maxLength: 3,
                    hintText: "CVC/CVV2",
                  ),
                )
              ],
            ),
            StyleHandler.y_margin,
            SizedBox(
              height: 80,
              child: Row(
                children: [
                  Flexible(
                      child:
                          SvgPicture.asset("assets/images/mastect_card.svg")),
                  Flexible(child: SvgPicture.asset("assets/images/mir.svg")),
                  Flexible(child: SvgPicture.asset("assets/images/visa.svg")),
                ],
              ),
            ),
            TextButton(
                onPressed: () {
                  Get.toNamed(Path.SALES_TEXT);
                },
                child: Text("Правила пользования")),
          ],
        ));
  }
}
