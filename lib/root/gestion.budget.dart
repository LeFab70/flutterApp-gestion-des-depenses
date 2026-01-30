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
          elevation: 4,
          toolbarHeight: 130.00,
          backgroundColor: AppColors.buttonBackground,
          foregroundColor: AppColors.backgroundApp,
          centerTitle: true,
          actionsIconTheme: IconThemeData(
            color: AppColors.buttonTextColor,
            size: 30,
          ),
        ),
        // iconButtonTheme: IconButtonThemeData(
        //   style: IconButton.styleFrom(
        //     foregroundColor: AppColors.buttonTextColor,
        //     hoverColor: AppColors.primary,
        //     iconSize: 30,
        //   ),
        // ),
        //Couleur floating button
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: AppColors.buttonBackground,
          foregroundColor: AppColors.buttonTextColor,
        ),
      ),
      home: GestionBudgetHome(),
    );
  }
}
