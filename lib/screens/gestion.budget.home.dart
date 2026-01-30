import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gestion_budget/data/categories.dart';
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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _expenseTitle = '';
  double _expenseAmount = 0.0;
  String _expenseCategory = 'Essence'; //default value
  DateTime _expenseDate = DateTime.now(); //defaut time

  double get _totalExpense =>
      _expenses.fold(
        0.0,
            (sum, expenseItem) => sum + expenseItem["expenseAmount"],
      );

  int get _numberOfExpense => _expenses.length;

  //Functions ici mais a deplacer pour un callback functions

  void _addExpense() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState?.save(); //le formulaire save les data
      //ajouter la depense dans la liste
      setState(() {
        _expenses.add({
          'expenseTitle': _expenseTitle,
          'expenseAmount': _expenseAmount,
          'expenseCategory': _expenseCategory,
          'expenseDate': _expenseDate,
        });
        //fermer la fenetre courante et retourner à la fenetre precedente
        Navigator.of(context).pop();
      });
    }
  }

  void _deleteExpense(int position) {
    setState(() {
      _expenses.removeAt(position);
    });
  }

  void _showAddExpense() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      // Permet au panneau de monter quand le clavier apparaît
      backgroundColor: Colors.transparent,
      // Pour avoir des bords arrondis propres
      builder: (context) =>
          Padding(
            // Padding dynamique pour que le clavier ne cache pas les champs
            padding: EdgeInsets.only(
              bottom: MediaQuery
                  .of(context)
                  .viewInsets
                  .bottom,
            ),
            child: Container(
              decoration: const BoxDecoration(
                color: AppColors.backgroundLight,
                borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
              ),
              padding: const EdgeInsets.all(20),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Ajouter une dépense",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textSecondary,
                      ),
                    ),
                    const SizedBox(height: 20),
                    _buildTextField(
                      "Titre",
                          (val) => _expenseTitle = val!,
                      Icons.title,
                    ),
                    const SizedBox(height: 10),
                    _buildTextField(
                      "Montant",
                          (val) =>
                      _expenseAmount = double.tryParse(val!) ?? 0.0,
                      Icons.attach_money,
                      isNumber: true,
                    ),
                    const SizedBox(height: 10),
                    _buildDropDownButton(
                      _expenseCategory,
                      'Categorie',
                          (val) => _expenseCategory = val!,
                          (val) => _expenseCategory = val!,
                    ),
                    const SizedBox(height: 10),
                    _buildPicked(),
                    const SizedBox(height: 18),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: _addExpense,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.buttonBackground,
                          foregroundColor: AppColors.buttonTextColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: const Text(
                          "Enregistrer la dépense",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
    );
  }

  // Petit helper pour éviter la répétition de code
  Widget _buildTextField(String label,
      Function(String?) onSave,
      IconData icon, {
        bool isNumber = false,
      }) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.textColor),
        ),
      ),
      keyboardType: isNumber
          ? TextInputType.numberWithOptions(decimal: true)
          : TextInputType.text,
      inputFormatters: isNumber
          ? [FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))]
          : null,
      validator: (value) {
       if(value == null || value.isEmpty) return "Champ requis";
       if(isNumber && double.tryParse(value)==null) return "Nombre invalide";
       return null;
      },
      onSaved: onSave,
    );
  }

  Widget _buildDropDownButton(String initialValue,
      String label,
      Function(String?) onSave,
      Function(String?) onChanged,) {
    return DropdownButtonFormField<String>(
      initialValue: initialValue,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: AppColors.textColor),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.textColor),
        ),
      ),
      items: Categories.categories
          .map(
            (category) =>
            DropdownMenuItem(
              value: category,
              child: Text(
                category,
                style: TextStyle(color: AppColors.textColor),
              ),
            ),
      )
          .toList(),
      onChanged: onChanged,
      onSaved: onSave,
    );
  }

  Widget _buildPicked() {
    return InkWell(
      // On utilise InkWell pour capturer le clic sur toute la zone
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: _expenseDate,
          // Ajoute l'initialDate pour éviter les erreurs
          firstDate: DateTime(2023),
          lastDate: DateTime.now(),
          builder: (context, child) {
            return Theme(
              data: ThemeData.light().copyWith(
                colorScheme: ColorScheme.light(
                  primary: AppColors.primary,
                  onPrimary: Colors.white,
                  onSurface: AppColors.textSecondary,
                ),
              ),
              child: child!,
            );
          },
        );
        if (pickedDate != null) {
          setState(() {
            _expenseDate = pickedDate;
          });
        }
      },
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: 'Date de la dépense',
          prefixIcon: const Icon(Icons.calendar_today),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
        child: Text(
          '${_expenseDate.toLocal()}'.split(' ')[0],
          style: TextStyle(color: AppColors.textColor, fontSize: 16),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      //positionner le button a droite et encoche
      appBar: AppBars(onPressed: _showAddExpense),
      body: Column(
        children: [
          Expanded(
            child: ExpenseList(
              expenseList: _expenses,
              onDeleteFromHome: _deleteExpense,
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomBars(
        totalExpense: _totalExpense,
        numberOfExpense: _numberOfExpense,
      ),
      floatingActionButton: FloatingButtons(onPressed: _showAddExpense),
    );
  }
}
