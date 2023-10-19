import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:the_one_tech/view/screen/search_screen.dart';

import '../../models/location_modelis.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key, this.dataIndex});
  int? dataIndex;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  LocationModel? data;
  List<Widget> tabBar = [];
  List<Widget> pageView = [];
  int? valueIndex;

  @override
  void initState() {
    getStoredData();
    getData();
    valueIndex = widget.dataIndex ?? 0;

    super.initState();
  }

  getData() async {
    final dio = Dio();
    var location =
        "23.03744,72.566"; // The latitude and longitude coordinates to determine the user's current location.
    var rankby = "distance";
    bool sensor = true;
    String key = "AIzaSyB2Az9gVUzQULUc55xQD9AE7gj9Ni5hvJk";

    String api =
        "https://maps.googleapis.com/maps/api/place/search/json?&location=$location&rankby=$rankby&sensor=$sensor&key=$key";
    Response result = await dio.get(api);
    log("result: $result");
    if (result.statusCode == 200) {
      data = LocationModel.fromJson(result.data);

      // Save data in SharedPreferences
      saveDataToLocal(data!);

      setState(() {
        log("data Length: ${data?.results[0].types.length}");
      });
    } else {
      log("Error! Calling Weather API");
      return null;
    }
  }

  // TabBars Based on API Response
  List<Widget> getTabs() {
    tabBar.clear();
    data?.results[valueIndex!].types.forEach((element) {
      int i = 0;
      tabBar.add(Tab(
        child: Text("${data?.results[valueIndex!].types[i]}"),
      ));
      i++;
    });
    return tabBar;
  }

  // PageView Based on API Response
  List<Widget> getPageView() {
    data?.results[valueIndex!].types.forEach((element) {
      pageView.add(customPageView());
    });
    return pageView;
  }

  // Save data in local Storage
  saveDataToLocal(LocationModel data) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('location_data', jsonEncode(data.toJson()));
  }

  Future<LocationModel?> getStoredData() async {
    final prefs = await SharedPreferences.getInstance();
    String? storedData = prefs.getString('location_data');
    if (storedData != null) {
      data = LocationModel.fromJson(jsonDecode(storedData));
    }
  }

  @override
  Widget build(BuildContext context) {
    return data == null
        ? const Scaffold(body: Center(child: CircularProgressIndicator()))
        : DefaultTabController(
            length: data!.results[valueIndex!].types.length,
            child: Scaffold(
              appBar: AppBar(
                centerTitle: true,
                elevation: 2,
                title: const Text("Location App"),
                bottom: TabBar(
                  tabs: getTabs(),
                ),
                actions: [
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    SearchScreen(searchData: data!),
                                fullscreenDialog: true));
                      },
                      icon: const Icon(Icons.search))
                ],
              ),
              body: TabBarView(
                children: getPageView(),
              ),
            ),
          );
  }

  Container customPageView() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: MediaQuery.of(context).size.height * .8,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          "Name: ${data?.results[valueIndex!].name}",
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Text("Place Id: ${data?.results[valueIndex!].placeId}"),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: Image.network("${data?.results[valueIndex!].icon}"),
        ),
        Text("vicinity: ${data?.results[valueIndex!].vicinity}"),
      ]),
    );
  }
}
