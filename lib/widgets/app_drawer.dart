import 'package:flutter/material.dart';
import '../helpers/custom_route.dart';
import 'package:provider/provider.dart';

import '../screens/user_products_screen.dart';
import '../screens/orders_screen.dart';
import '../providers/auth.dart';

class AppDrawer extends StatelessWidget {
  Widget buildAppdrawerItem(
    IconData icon,
    String title,
    Function tapHandler,
  ) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text('Hello friend!'),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          buildAppdrawerItem(Icons.shop, 'Shop', () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          Divider(),
          buildAppdrawerItem(Icons.payment, 'Orders', () {
            // Navigator.of(context).pushReplacementNamed(OrdersScreen.routeName);
            Navigator.of(context).pushReplacement(
              CustomRoute(
                builder: (ctx) => OrdersScreen(),
              ),
            );
          }),
          Divider(),
          buildAppdrawerItem(Icons.edit, 'Manage Products', () {
            Navigator.of(context)
                .pushReplacementNamed(UserProductsScreen.routeName);
          }),
          Divider(),
          buildAppdrawerItem(Icons.exit_to_app, 'Logout', () {
            Navigator.of(context).pop();
            Navigator.of(context).pushReplacementNamed('/');
            Provider.of<Auth>(context, listen: false).logout();
          })

          // ListTile(
          //   leading: Icon(Icons.shop),
          //   title: Text('Shop'),
          //   onTap: () {
          //     Navigator.of(context).pushReplacementNamed('/');
          //   },
          // ),
          // Divider(),
          // ListTile(
          //   leading: Icon(Icons.payment),
          //   title: Text('Orders'),
          //   onTap: () {
          //     Navigator.of(context)
          //         .pushReplacementNamed(OrdersScreen.routeName);
          //   },
          // ),
          // Divider(),
          // ListTile(
          //   leading: Icon(Icons.edit),
          //   title: Text('Manage Products'),
          //   onTap: () {
          //     Navigator.of(context)
          //         .pushReplacementNamed(UserProductsScreen.routeName);
          //   },
          // ),
        ],
      ),
    );
  }
}
