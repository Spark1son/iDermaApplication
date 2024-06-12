import 'package:flutter/material.dart';

class TopNavigationAppBar extends StatelessWidget implements PreferredSizeWidget {


  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'iDerma',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2C3D8F),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              
              // Navigator.pushNamed(context, '/main_menu');
              
            },
          ),
        ],
      ),
    );


  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
  
}
