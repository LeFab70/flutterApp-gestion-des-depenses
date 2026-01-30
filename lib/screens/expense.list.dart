import 'package:flutter/material.dart';
import 'package:gestion_budget/screens/list.row.expense.dart';
import 'package:gestion_budget/shares/colors/app.colors.dart';

class ExpenseList extends StatelessWidget {
  final List<Map<String, dynamic>> expenseList;
  final Function(int) onDeleteFromHome;

  const ExpenseList({
    super.key,
    required this.expenseList,
    required this.onDeleteFromHome,
  });

  @override
  Widget build(BuildContext context) {
    return expenseList.isEmpty
        ? Center(
      child: Text(
        "Aucune depenses pour le moment",
        style: TextStyle(fontSize: 20, color: AppColors.textColor),
      ),
    )
        : ListView.builder(
      itemCount: expenseList.length,
      itemBuilder: (context, index) {
        final expense = expenseList[index];
        return Dismissible(
          key: ValueKey(expense),
          direction: DismissDirection.endToStart,
          onDismissed: (direction) {
            /*supprmier expenses; */
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Dépense supprimée")),
            );
                },
          background: Container(
            color: AppColors.error,
            alignment: Alignment.center,
            padding: EdgeInsets.only(right: 20),
            child: Icon(Icons.delete, color: AppColors.buttonTextColor),
          ),
          child: Center(
            child: ListRowexpense(
              expense: expense,
              position: index,
              onDelete: (index) {
                onDeleteFromHome(index);
              },
            ),
          ),
        );
      },
    );
  }
}
