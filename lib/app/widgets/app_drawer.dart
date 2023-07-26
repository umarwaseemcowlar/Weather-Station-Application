import 'package:flutter/material.dart';
import 'package:weather_station_app/app/themes/colors.dart';

class AppDrawerWidget extends StatefulWidget {
  const AppDrawerWidget({super.key});

  @override
  State<AppDrawerWidget> createState() => _AppDrawerWidgetState();
}

class _AppDrawerWidgetState extends State<AppDrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primaryPurpleLight,
      width: MediaQuery.of(context).size.width * 0.75,
      child: Column(children: [
        UserAccountsDrawerHeader(
          currentAccountPicture: CircleAvatar(
            backgroundColor: Theme.of(context).colorScheme.secondary,
            child: const FlutterLogo(),
          ),
          accountName: Text(
            "Umar Waseem",
            style: Theme.of(context).textTheme.displayMedium,
          ),
          accountEmail: Text(
            "umar.waseem@gmail.com",
            style: Theme.of(context).textTheme.displaySmall,
          ),
        ),
        InkWell(
          onTap: () {},
          child: ListTile(
            leading: const Icon(Icons.home, color: Colors.white),
            title: Text(
              "Home",
              style: Theme.of(context).textTheme.displaySmall?.copyWith(fontSize: 14),
            ),
          ),
        ),
        Expanded(child: Container()),
        InkWell(
          onTap: () {},
          child: ListTile(
            leading: const Icon(Icons.logout, color: Colors.white),
            title: Text(
              "Logout",
              style: Theme.of(context).textTheme.displaySmall?.copyWith(fontSize: 14),
            ),
          ),
        ),
        const SizedBox(height: 30)
      ]),
    );
  }
}
