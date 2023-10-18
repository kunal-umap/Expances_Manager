import 'package:flutter/material.dart';

Drawer topBarMenu() {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        UserAccountsDrawerHeader(
          accountName: const Text(
            'Account Name',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          accountEmail: null,
          currentAccountPicture: CircleAvatar(
            child: ClipOval(
              child: Image.asset(
                'assects/images/user-6332708-5209354.webp',
                width: 90,
                height: 90,
                fit: BoxFit.cover,
              ),
            ),
          ),
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                  'assects/images/360_F_521958580_kNDeJSIB0VUVqJ0n9fUwwubwHTRkn2VS.jpg'),
            ),
          ),
        ),
        ListTile(
          leading: const Icon(Icons.home),
          title: const Text(
            'Home',
            style: TextStyle(fontSize: 17),
          ),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.monetization_on),
          title: const Text('My Expences', style: TextStyle(fontSize: 16)),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.safety_check_rounded),
          title: const Text('Budgets', style: TextStyle(fontSize: 16)),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.settings),
          title: const Text('Settings', style: TextStyle(fontSize: 16)),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.policy),
          title: const Text('Policies', style: TextStyle(fontSize: 16)),
          onTap: () {},
        ),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.exit_to_app),
          title: const Text('Exit', style: TextStyle(fontSize: 17)),
          onTap: () {},
        ),
      ],
    ),
  );
}
