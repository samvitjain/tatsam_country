import 'package:flutter/material.dart';
import 'package:tatsam_country/data/models/country_model.dart';
import 'package:tatsam_country/modules/common/widgets/creator_tag.dart';
import 'package:tatsam_country/modules/country/country_bloc.dart';
import 'package:tatsam_country/modules/country/fav_country_page.dart';

class CountryPage extends StatefulWidget {
  const CountryPage({Key? key}) : super(key: key);

  @override
  State<CountryPage> createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  final _bloc = CountryBloc();
  List<Country> allCountries = [];
  List<String> favCountries = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Country'),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.favorite,
            ),
            color: Colors.redAccent,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FavouriteCountyView(
                    favCountryList: allCountries
                        .where((element) => favCountries.contains(element.code))
                        .toList(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: FutureBuilder<List<Country>?>(
            future: _bloc.getCountries(),
            builder: (context, snaphsot) {
              if (snaphsot.hasData && snaphsot.data != null) {
                allCountries = snaphsot.data!;
                return Column(
                  children: [
                    ListView.builder(
                        itemCount: allCountries.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (ctx, index) {
                          return ListTile(
                            leading: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(allCountries[index].code),
                              ],
                            ),
                            title: Text(allCountries[index].country),
                            subtitle: Text(allCountries[index].region),
                            trailing: IconButton(
                              icon: const Icon(
                                Icons.favorite,
                              ),
                              color: favCountries
                                      .contains(allCountries[index].code)
                                  ? Colors.red
                                  : Colors.grey,
                              onPressed: () {
                                setState(() {
                                  if (favCountries
                                      .contains(allCountries[index].code)) {
                                    favCountries
                                        .remove(allCountries[index].code);
                                  } else {
                                    favCountries.add(allCountries[index].code);
                                  }
                                });
                              },
                            ),
                          );
                        }),
                    const CreatorTag(),
                  ],
                );
              } else if (snaphsot.hasError) {
                return Center(
                  child: Text(
                    snaphsot.error.toString(),
                  ),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ),
    );
  }
}
