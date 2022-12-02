import 'package:covid_19_tracking_app/ViewModel/world_states_view_model.dart';
import 'package:covid_19_tracking_app/utils/color.dart';

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'details_list_screen.dart';

class CountriesListScreeen extends StatefulWidget {
  const CountriesListScreeen({Key? key}) : super(key: key);

  @override
  State<CountriesListScreeen> createState() => _CountriesListScreeenState();
}

class _CountriesListScreeenState extends State<CountriesListScreeen> {
  TextEditingController searchController = TextEditingController();
  WorldStateViewModel worldStatesViewModel = WorldStateViewModel();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          backgroundColor: kCardColor,
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: const Text(
            "Countires List",
            style: TextStyle(fontSize: 22),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                TextFormField(
                  controller: searchController,
                  onChanged: (value) {
                    setState(() {});
                  },
                  cursorColor: Colors.black,
                  cursorHeight: 22,
                  decoration: InputDecoration(
                      hintText: 'Search with country name',
                      suffixIcon: searchController.text.isEmpty
                          ? const Icon(Icons.search)
                          : GestureDetector(
                              onTap: () {
                                searchController.text = "";
                                setState(() {});
                              },
                              child: Icon(Icons.clear)),
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 10),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: FutureBuilder(
                    future: worldStatesViewModel.countriesListApi(),
                    builder: ((context, AsyncSnapshot<List<dynamic>> snapshot) {
                      if (!snapshot.hasData) {
                        return ListView.builder(
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              return Shimmer.fromColors(
                                baseColor: kBGColor,
                                highlightColor: kDynamic,
                                child: Column(
                                  children: [
                                    ListTile(
                                      title: Container(
                                          height: 20,
                                          width: 10,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(10))),
                                      subtitle: Container(
                                          margin:
                                              const EdgeInsets.only(right: 50),
                                          height: 15,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(10))),
                                      leading: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        height: 50,
                                        width: 50,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            });
                      } else {
                        return ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              String name = snapshot.data![index]["country"];

                              if (searchController.text.isEmpty) {
                                return Column(
                                  children: [
                                    Card(
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => DetailScreen(
                                                    name: snapshot.data![index]
                                                        ["country"],
                                                    totalCases: snapshot.data![index]
                                                        ['cases'],
                                                    totalDeaths: snapshot
                                                        .data![index]["deaths"],
                                                    totalRecovered:
                                                        snapshot.data![index]
                                                            ["recovered"],
                                                    todayCases: snapshot.data![index]
                                                        ["todayCases"],
                                                    active: snapshot.data![index]
                                                        ["active"],
                                                    critical: snapshot.data![index]
                                                        ["critical"],
                                                    todayRecovered:
                                                        snapshot.data![index]
                                                            ["todayRecovered"],
                                                    test: snapshot.data![index]["tests"]),
                                              ));
                                        },
                                        child: ListTile(
                                          title: Text(
                                              snapshot.data![index]['country']),
                                          subtitle: Text(
                                              "Total Cases: ${(snapshot.data![index]['cases'])}"),
                                          leading: Image(
                                              height: 50,
                                              width: 50,
                                              image: NetworkImage(
                                                snapshot.data![index]
                                                    ['countryInfo']['flag'],
                                              )),
                                          trailing: Icon(Icons.play_arrow,
                                              size: height * 0.02),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              } else if (name.toLowerCase().contains(
                                  searchController.text.toLowerCase())) {
                                return Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => DetailScreen(
                                                  name: snapshot.data![index]
                                                      ["country"],
                                                  totalCases: snapshot.data![index]
                                                      ['cases'],
                                                  totalDeaths: snapshot
                                                      .data![index]["deaths"],
                                                  totalRecovered:
                                                      snapshot.data![index]
                                                          ["recovered"],
                                                  todayCases: snapshot.data![index]
                                                      ["todayCases"],
                                                  active: snapshot.data![index]
                                                      ["active"],
                                                  critical: snapshot.data![index]
                                                      ["critical"],
                                                  todayRecovered:
                                                      snapshot.data![index]
                                                          ["todayRecovered"],
                                                  test: snapshot.data![index]["tests"]),
                                            ));
                                      },
                                      child: ListTile(
                                        title: Text(
                                            snapshot.data![index]['country']),
                                        subtitle: Text(
                                            "Total Cases: ${(snapshot.data![index]['cases'])}"),
                                        leading: Image(
                                            height: 50,
                                            width: 50,
                                            image: NetworkImage(
                                              snapshot.data![index]
                                                  ['countryInfo']['flag'],
                                            )),
                                      ),
                                    )
                                  ],
                                );
                              } else {
                                return Container();
                              }
                            });
                      }
                    }),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
