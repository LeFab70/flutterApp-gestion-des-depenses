import 'package:flutter/material.dart';
import 'package:gestion_budget/screens/expense.list.dart';
import 'package:gestion_budget/shares/colors/app.colors.dart';
import 'package:gestion_budget/widgets/app.bar.dart';
import 'package:gestion_budget/widgets/bottom.bar.dart';
import 'package:gestion_budget/widgets/floating.buttons.dart';

class GestionBudgetHome extends StatefulWidget {
  const GestionBudgetHome({super.key});

  @override
  State<GestionBudgetHome> createState() => _GestionBudgetHomeState();
}

class _GestionBudgetHomeState extends State<GestionBudgetHome> {
  final List<Map<String, dynamic>> _expenses = [];

  //_formKey permet la gestion de la validation du form et autres opérations
  final _fomKey = GlobalKey<FormState>();
  String _expenseTitle = '';
  double _expenseAmount = 0.0;
  String _expenseCategory = 'Essence'; //default value
  DateTime _expenseDate = DateTime.now(); //defaut time

  double get _totalExpense=>_expenses.fold(0.0,(sum,expenseItem)=>sum+expenseItem["expenseAmount"]);
  int get _numberOfExpense=>_expenses.length;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      //positionner le button a droite et encoche
      appBar: const AppBars(),
      body: Column(
        children: [Expanded(child: ExpenseList(expenseList: _expenses))],
      ),
      bottomNavigationBar: BottomBars(),
      floatingActionButton: const FloatingButtons(),
    );
  }
}
