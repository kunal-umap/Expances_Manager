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
              child: Image.network(
                'https://cdn3d.iconscout.com/3d/premium/thumb/user-6332708-5209354.png',
                width: 90,
                height: 90,
                fit: BoxFit.cover,
              ),
            ),
          ),
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(
                  'https://img.freepik.com/premium-photo/stack-black-money-coin-banking-currency-business-finance-cash-dollar-treasure-earnings-financial-profit-market-investment-stock-exchange-dark-3d-background-with-success-economy-income_79161-2032.jpg'),
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
