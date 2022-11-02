import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/border/gf_dashed_border.dart';
import 'package:location_specialist/helpers/widgets/location/provider/select_location_provider.dart';
import 'package:location_specialist/routes/path.dart';
import 'package:provider/provider.dart';

import '../../../models/location/location.dart';
import '../../button/implementations/red-button.dart';

class SelectLocations extends StatelessWidget {
  const SelectLocations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SelectLocationProvider>(
      create: (context) => new SelectLocationProvider(),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          leading: Builder(builder: (context) {
            return IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed: () {
                Provider.of<SelectLocationProvider>(context, listen: false)
                    .back();
              },
            );
          }),
          title: Center(
            child: Text(
              "Выбор Локации",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black, fontSize: 15),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Builder(builder: (context) {
            return Column(
              children: [
                Expanded(
                  child: Consumer<SelectLocationProvider>(
                      builder: (context, provider, child) {
                    return ListView.builder(
                        itemCount: provider.location.length,
                        itemBuilder: (context, index) => Dismissible(
                              background: Container(color: Colors.red),
                              onDismissed: (DismissDirection direction) {
                                provider.removeLocation(index);
                              },
                              key: Key("location_select_" +
                                  provider.location[index].id.toString()),
                              child: ListTile(
                                  title: Text(provider.location[index].name)),
                            ));
                  }),
                ),
                RedButton(
                    onPressed: () async {
                      var object = await Get.toNamed(Path.CHOOSE_LOCATION);
                      if (object != null)
                        Provider.of<SelectLocationProvider>(context,
                                listen: false)
                            .addToLocation(object);
                    },
                    text: "Добавить новую локацию")
              ],
            );
          }),
        ),
      ),
    );
  }
}
