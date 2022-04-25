import 'package:flutter/material.dart';
import 'package:preferences_app/widgets/widgets.dart';

import '../shared_preferences/preferences.dart';

class HomeScreen extends StatelessWidget {
	static const String routerName = 'Home';
   
	const HomeScreen({Key? key}) : super(key: key);
	
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: const Text('Home')
			),
			drawer: const SideMenu(),
			body: Column(
				mainAxisAlignment: MainAxisAlignment.center,
				children: [
					Text('Dark Mode: ${ Preferences.isDarkMode }'),
					const Divider(),
					Text('Genero: ${ Preferences.gender }'),
					const Divider(),
					Text('Nombre de usuario: ${ Preferences.name }'),
					const Divider(),
				],
			),
		);
	}
}