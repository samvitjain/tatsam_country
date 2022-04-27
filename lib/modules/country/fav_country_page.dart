import 'package:flutter/material.dart';
import 'package:tatsam_country/data/models/country_model.dart';

class FavouriteCountyView extends StatelessWidget {
  List<Country> favCountryList;
  FavouriteCountyView({
    Key? key,
    required this.favCountryList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: favCountryList.length,
          itemBuilder: (ctx, index) {
            return ListTile(
              leading: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(favCountryList[index].code),
                ],
              ),
              title: Text(favCountryList[index].country),
              subtitle: Text(favCountryList[index].region),
              // trailing: IconButton(
              //   icon: const Icon(
              //     Icons.favorite,
              //   ),
              //   color: favCountries.contains(favCountryList[index].code)
              //       ? Colors.red
              //       : Colors.grey,
              //   onPressed: () {
              //     setState(() {
              //       if (favCountries
              //           .contains(favCountryList[index].code)) {
              //         favCountries.remove(favCountryList[index].code);
              //       } else {
              //         favCountries.add(favCountryList[index].code);
              //       }
              //     });
              //   },
              // ),
            );
          }),
    );
  }
}
