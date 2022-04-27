import 'package:flutter/material.dart';
import 'package:tatsam_country/data/models/country_model.dart';

// Used stateless widget because its less expensive to use.
class FavouriteCountyView extends StatelessWidget {
  List<Country> favCountryList;
  FavouriteCountyView({
    Key? key,
    required this.favCountryList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourite'),
      ),
      body: favCountryList.length > 0
          ? ListView.builder(
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
                  trailing: Text('${index + 1}'),
                );
              })
          : const Center(
              child: Text('No favourite countries.'),
            ),
    );
  }
}
