import 'package:flutter/material.dart';
import 'package:gestion_budget/shares/colors/app.colors.dart';
// import 'package:gestion_budget/main.dart';

class ListRowexpense extends StatelessWidget {
  final Map<String, dynamic> expense;
  final int position;
  final Function(int) onDelete;

  const ListRowexpense({
    super.key,
    required this.expense,
    required this.position,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(expense),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        onDelete(
          position,
        ); // On prévient le parent qu'il faut supprimer à cet index
      },
      background: Container(
        color: AppColors.error,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      child: Card(
        color: AppColors.backgroundLight,
        margin: EdgeInsetsGeometry.symmetric(vertical: 8, horizontal: 16),
        child: ListTile(
          leading: CircleAvatar(
            //Container
            //padding: EdgeInsets.all(10),
            //decoration: BoxDecoration(
            //color: AppColors.buttonBackground,
            //borderRadius: BorderRadius.circular(100)
            //),
            radius: 28,
            backgroundColor: AppColors.buttonBackground,
            foregroundColor: AppColors.buttonTextColor,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: FittedBox(
                child: Text(
                  '\$ ${expense['expenseAmount'].toString()}',
                  style: TextStyle(
                    color: AppColors.buttonTextColor,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          title: Text(
            expense['expenseTitle'],
            style: TextStyle(color: AppColors.primary),
          ),
          subtitle: Text(
            '${expense['expenseCategory']} -  ${expense['expenseDate'].toLocal().toString().split(' ')[0]}',
            style: TextStyle(color: AppColors.secondary),
          ),
          // trailing: IconButton(
          //   icon: Icon(Icons.delete_rounded, color: AppColors.error),
          //   onPressed: () => onDelete(position),
          // ),
        ),
      ),
    );
  }
}
