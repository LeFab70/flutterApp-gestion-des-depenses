import 'package:flutter/material.dart';
import 'package:gestion_budget/shares/colors/app.colors.dart';

class ExpenseList extends StatelessWidget {
  final List<Map<String, dynamic>> expenseList;

  const ExpenseList({super.key, required this.expenseList});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child:
        expenseList.isEmpty ?
        Center(
          child: Text("Aucune depenses pour le moment",
            style: TextStyle(fontSize: 20, color: AppColors.textColor),),
        ):
            ListView.builder(
              itemCount: expenseList.length,
              itemBuilder: (context,index){

              },
            )
        )
      ],
    );
  }
}
