import 'package:flutter/material.dart';
import 'package:location_specialist/helpers/static/style_handler.dart';
import 'package:location_specialist/helpers/widgets/drop_down/implementations/pr-dropdown.dart';
import 'package:location_specialist/pages/location/provider/city_provider.dart';
import 'package:location_specialist/pages/location/provider/country_provider.dart';
import 'package:location_specialist/pages/location/provider/location_form_provider.dart';
import 'package:provider/provider.dart';

class CountryCityDropDown extends StatelessWidget {
  const CountryCityDropDown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CountryProvider>(
            create: (_) => CountryProvider()),
        ChangeNotifierProvider<CityProvider>(create: (_) => CityProvider()),
      ],
      child: Row(
        children: [
          Flexible(
            child: Builder(builder: (context) {
              return PrDropDown(
                hintText: "Выберите Страну",
                items: Provider.of<CountryProvider>(context).getCountryMap(),
                onChange: (int countryId) {
                  Provider.of<CityProvider>(context, listen: false)
                      .onSelectCountry(countryId);
                },
              );
            }),
          ),
          StyleHandler.x_margin,
          Flexible(
            child: Consumer<CityProvider>(builder: (context, provider, child) {
              return PrDropDown(
                hintText: "Выберите Город",
                items: provider.getCityMap(),
                onChange: (int cityId) {
                  Provider.of<LocationFormProvider>(context, listen: false)
                      .setLocations("city", cityId);
                },
              );
            }),
          )
        ],
      ),
    );
  }
}
