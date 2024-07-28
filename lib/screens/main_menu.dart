import 'package:flutter/material.dart';

//import 'package:main_menu/main_menu.dart';
//import 'package:flutter/material.dart';
//import 'package:main_menu/main_menu.dart';

//Created by Georgios Koutalios
//Added the icons at assets/images/main_menu_icons

void main() {
  runApp(const MenuApp());
}

class MenuApp extends StatelessWidget {
  const MenuApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'iDerma Menu',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MenuScreen(),
    );
  }
}

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(44, 61, 143, 1),
        title: const Text('iDerma',
            style: TextStyle(
                color: Colors.white,
                fontSize: 36,
                fontWeight: FontWeight.w500)),
        actions: [
          TextButton(
            onPressed: () {
              // Handle close button tap
            },
            child: const Text('Close',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.normal)),
          ),
        ],
      ),
      body: Container(
        color: const Color.fromRGBO(44, 61, 143, 1),
        child: Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.only(
                top: 80), // Adjust this to move buttons higher or lower
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                MenuItem(
                  text: 'Homepage',
                  icon: 'assets/images/main_menu_icons/home.png',
                  onTap: () {
                    // Button payload
                  },
                ),
                const SizedBox(height: 25), // Add spacing between buttons
                MenuItem(
                  text: 'FaQ',
                  icon: 'assets/images/main_menu_icons/faq.png',
                  onTap: () {
                    // Button payload
                  },
                ),
                const SizedBox(height: 25), // Add spacing between buttons
                MenuItem(
                  text: 'How the Model Works',
                  icon: 'assets/images/main_menu_icons/gear.png',
                  onTap: () {
                    // Button payload
                  },
                ),
                const SizedBox(height: 25), // Add spacing between buttons
                MenuItem(
                  text: 'Terms Of Use',
                  icon: 'assets/images/main_menu_icons/terms_of_use.png',
                  onTap: () {
                    // Button payload
                  },
                ),
                const SizedBox(height: 25), // Add spacing between buttons
                MenuItem(
                  text: 'Privacy Policy',
                  icon: 'assets/images/main_menu_icons/privacy_policy.png',
                  onTap: () {
                    // Button payload
                  },
                ),
                const SizedBox(height: 25), // Add spacing between buttons
                MenuItem(
                  text: 'About EMB',
                  icon: 'assets/images/main_menu_icons/about.png',
                  onTap: () {
                    // Button payload
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  // Button payload
                },
                icon: const Icon(Icons.logout, color: Colors.white, size: 30),
              ),
              const SizedBox(width: 8),
              const Text('Logout',
                  style: TextStyle(color: Colors.white, fontSize: 20)),
            ],
          ),
        ),
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final String text;
  final dynamic icon;
  final Function onTap;

  const MenuItem({
    Key? key,
    required this.text,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Check if iconData is provided
            _buildIcon(context),
            const SizedBox(width: 16),
            Text(
              text,
              style: const TextStyle(fontSize: 26, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIcon(BuildContext context) {
    if (icon is IconData) {
      // Built-in icon
      return Icon(icon, size: 24, color: Colors.white);
    } else if (icon is String) {
      // Custom icon from assets
      return Image.asset(
        icon,
        width: 24,
        height: 24,
        color: Colors.white,
      );
    } else {
      return Container();
    }
  }
}
