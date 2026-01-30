import 'package:flutter/material.dart';
import 'package:gestion_budget/screens/expense.list.dart';
import 'package:gestion_budget/widgets/app.bar.dart';

class GestionBudgetHome extends StatefulWidget {
  const GestionBudgetHome({super.key});

  @override
  State<GestionBudgetHome> createState() => _GestionBudgetHomeState();
}

class _GestionBudgetHomeState extends State<GestionBudgetHome> {
  final List<Map<String,dynamic>> _expenses=[];
  //_formKey permet la gestion de la validation du form et autres opérations
  final _fomKey=GlobalKey<FormState>();
  String _expenseTitle='';
  double _expenseAmount=0.0;
  String _expenseCategory='Essence'; //default value
  DateTime _expenseDate=DateTime.now(); //defaut time
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:const AppBars(),
      body: ExpenseList(expenseList: _expenses,),
    );
  }
}
