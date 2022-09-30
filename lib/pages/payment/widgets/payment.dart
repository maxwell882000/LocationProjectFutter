import 'package:flutter/material.dart';
import 'package:location_specialist/helpers/models/payment/plans.dart';
import 'package:location_specialist/helpers/widgets/button/implementations/red-button.dart';
import 'package:location_specialist/helpers/widgets/loading/widgets/loading.dart';
import 'package:location_specialist/helpers/widgets/scaffold/scaffold_inside.dart';
import 'package:location_specialist/pages/payment/providers/plan_provider.dart';
import 'package:provider/provider.dart';


class Payment extends StatelessWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => PlanProvider(),
        child: Builder(builder: (context) {
          return ScaffoldInside(
              bottomSheet: Padding(
                padding: EdgeInsets.all(20),
                child: RedButton(
                  text: "Выбрать",
                  onPressed: () {
                    Provider.of<PlanProvider>(context,listen: false).registerOrder();
                  },
                ),
              ),
              body: Loading<PlanProvider>(
                child:
                    Consumer<PlanProvider>(builder: (context, provider, child) {
                  return ListView.builder(
                      itemCount: provider.plan.length,
                      itemBuilder: (context, index) {
                        final Plan plan = provider.plan[index];
                        return ListTile(
                          title: Text(plan.description.toString()),
                          onTap: () {
                            provider.selected = index;
                          },
                          selected: provider.selected == index,
                          subtitle: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Количество дней: " + plan.days.toString()),
                              Text(
                                plan.amount.toString(),
                                style: TextStyle(fontSize: 20),
                              )
                            ],
                          ),
                          isThreeLine: true,
                        );
                      });
                }),
              ));
        }));
  }
}
