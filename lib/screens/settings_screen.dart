import 'package:flutter/material.dart';
import 'package:preferences_app/providers/theme_provider.dart';
import 'package:preferences_app/shared_preferences/preferences.dart';
import 'package:preferences_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
	static const String routerName = 'Settings';
   
	const SettingsScreen({Key? key}) : super(key: key);

	@override
	State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

	// bool isDarkMode = false;
	// int gender = 1;
	// String name = 'Pedro'; 

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: const Text('Seetings'),
			),
			drawer: const SideMenu(),
			body: SingleChildScrollView(
				child: Column(
					crossAxisAlignment: CrossAxisAlignment.start,
					children: [
						const Text('Ajustes', style: TextStyle( fontSize: 45, fontWeight: FontWeight.w300) ),
						const Divider(),
						SwitchListTile(
							value: Preferences.isDarkMode, 
							title: const Text('Dark Mode'),
							onChanged: ( value ) {
								Preferences.isDarkMode = value;
								final themeProvider = Provider.of<ThemeProvider>(context, listen: false );
								value 
									? themeProvider.setDarkMode() 
									: themeProvider.setLightMode();
								setState(() { });
							}
						),
						const Divider(),
						RadioListTile<int>(
							value: 1, 
							groupValue: Preferences.gender,
							title: const Text('Masculino'), 
							onChanged: ( value ) {
								Preferences.gender = value ?? 1;
								setState(() { });
							}
						),
						const Divider(),
						RadioListTile<int>(
							value: 2, 
							groupValue: Preferences.gender,
							title: const Text('Femenino'), 
							onChanged: ( value ) {
								Preferences.gender = value ?? 1;
								setState(() { });
							}
						),
						const Divider(),
						RadioListTile<int>(
							value: 3, 
							groupValue: Preferences.gender,
							title: const Text('Se lo que quieras ser, se una barbie girl'), 
							onChanged: ( value ) {
								Preferences.gender = value ?? 1;
								setState(() { });
							}
						),
						const Divider(),
						Padding(
							padding: const EdgeInsets.symmetric( horizontal: 20),
							child: TextFormField(
								initialValue: Preferences.name,
								onChanged: ( value ) {
									Preferences.name = value;
									setState(() { });
								},
								decoration: const InputDecoration(
									labelText: 'Nombre',
									helperText: 'Nombre del usuario'
								),
							),
						)
					],
				),
			),
		);
	}
}