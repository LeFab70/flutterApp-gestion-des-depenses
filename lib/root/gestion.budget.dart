import 'package:flutter/material.dart';
import 'package:gestion_budget/screens/gestion.budget.home.dart';
import 'package:gestion_budget/shares/colors/app.colors.dart';

class GestionBudget extends StatelessWidget {
  const GestionBudget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primaryColor: AppColors.primary,
        //couleur arriere plan principal
        scaffoldBackgroundColor: AppColors.backgroundApp,
        //Couleur app bar
        appBarTheme: AppBarTheme(

          elevation: 10,
          shape: RoundedRectangleBorder(),
          toolbarHeight: 130.00,
          backgroundColor: AppColors.buttonBackground,
          foregroundColor: AppColors.backgroundApp,
          centerTitle: true,
          actionsIconTheme: IconThemeData(
            color: AppColors.buttonTextColor,
            size: 30,
          ),
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: AppColors.buttonBackground,
          foregroundColor: AppColors.buttonTextColor,
          elevation: 20,
          shape: CircleBorder(),
        ),
        // iconButtonTheme: IconButtonThemeData(
        //   style: IconButton.styleFrom(
        //     foregroundColor: AppColors.buttonTextColor,
        //     hoverColor: AppColors.primary,
        //     iconSize: 30,
        //   ),
        // ),
        //Couleur floating button
        // bottomAppBarTheme: BottomAppBarTheme(
        //   shape: CircularNotchedRectangle(), // L'encoche
        //   notchMargin: 8.0,                  // L'espace autour du FAB
        //   elevation: 5,
        // ),
      ),
      home: GestionBudgetHome(),
    );
  }
}
