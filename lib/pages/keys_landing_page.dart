import 'package:flutter/material.dart';
import 'package:global_keys/pages/basic_key_page.dart';
import 'package:global_keys/pages/form_key_page.dart';

class KeysLandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Number of tabs
      child: Scaffold(
        body: TabBarView(
          children: [
            BasicKeyPage(),
            FormKeyPage(),
          ],
        ),
        bottomNavigationBar: Container(
          color: Theme.of(context).primaryColor,
          child: const TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            indicatorColor: Colors.white,
            tabs: [
              Tab(icon: Icon(Icons.beach_access), text: 'Basic Key'),
              Tab(icon: Icon(Icons.format_size), text: 'Form Key'),
            ],
          ),
        ),
      ),
    );
  }
}
