import 'dart:developer';

import 'package:flutter/material.dart';

import '../../models/location_modelis.dart';
import 'home.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({super.key, required this.searchData});

  final LocationModel searchData;
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<String> suggestionList = [];
  final List<String> items = [];
  @override
  void initState() {
    locationList();
    super.initState();
  }

  locationList() {
    for (var element in widget.searchData.results) {
      items.add(element.name.toString());
    }
  }

  void onSearchTextChanged(String query) {
    suggestionList = items
        .where((item) => item.toLowerCase().contains(query.toLowerCase()))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              const SizedBox(height: 10),
              _buildSearchBar(),
              const SizedBox(height: 10),
              _buildSuggestions(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      onChanged: onSearchTextChanged,
      decoration: InputDecoration(
        hintText: 'Search...',
        prefixIcon: const Icon(Icons.search),
        suffixIcon: IconButton(
          icon: const Icon(Icons.close, color: Colors.grey),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  Widget _buildSuggestions() {
    return Expanded(
      child: ListView.builder(
        itemCount: suggestionList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(suggestionList[index]),
            onTap: () {
              log('Selected: ${suggestionList[index]}');
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(dataIndex: index),
                  ),
                  (route) => false);
            },
          );
        },
      ),
    );
  }
}
