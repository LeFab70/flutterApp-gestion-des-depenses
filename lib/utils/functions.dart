import 'package:flutter/material.dart';

class Functions {
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static void addExpense(List<Map<String, dynamic>> expenses){
    if(_formKey.currentState!.validate()){
      _formKey.currentState?.save(); //le formulaire save les data
      //ajouter la depense dans la liste

    }
  }
}