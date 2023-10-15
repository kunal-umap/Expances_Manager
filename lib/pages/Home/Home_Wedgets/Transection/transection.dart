import 'package:expances_management/pages/Home/Home_Wedgets/Transection/Main_page.dart';
import 'package:flutter/material.dart';

class Transection extends StatelessWidget {
  const Transection({
    super.key,
  });

  @override
  SafeArea build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(20, 15, 0, 10),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Latest transaction",
                style: TextStyle(
                  fontSize: 22,
                ),
              ),
            ),
          ),
          Main_page(
            label: "Recieved",
            time: "Today, 03:07 am",
            icon: Icons.wallet,
            color: Colors.green,
            price: '₹100',
          ),
          Main_page(
            label: "Chinmay samosa",
            time: "Today, 03:01 am",
            icon: Icons.price_change,
            color: Colors.blue,
            price: '₹20',
          ),
          Main_page(
            label: 'Taxi',
            time: 'Today, 02:59 am',
            icon: Icons.directions_car_filled_rounded,
            color: Colors.grey,
            price: '₹300',
          ),
          Padding(
            padding: const EdgeInsets.all(2),
            child: Container(
              alignment: Alignment.centerLeft,
              width: double.infinity,
              height: 70,
              color: const Color.fromARGB(255, 24, 23, 23),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: GestureDetector(
                  onTap: () {},
                  child: const Text(
                    "VIEW TRANSACTIONS",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 18,
                      color: Color.fromARGB(255, 160, 25, 184),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
