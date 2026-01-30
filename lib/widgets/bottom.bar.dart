import 'package:flutter/material.dart';
import 'package:gestion_budget/shares/colors/app.colors.dart';

class BottomBars extends StatelessWidget {
  final double totalExpense;
  final int numberOfExpense;

  const BottomBars({
    super.key,
    required this.totalExpense,
    required this.numberOfExpense,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: 100.0,
      color: AppColors.secondary,
      shape: const CircularNotchedRectangle(),
      //ajoute encoche
      notchMargin: 8.0,
      //espace entre button flotant et les bords
      child: Column(
        mainAxisSize: MainAxisSize.min, //ne pas prendre tout ecran
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          _buildInfoRow(
            "Total des dépenses :",
            " ${totalExpense.toStringAsFixed(2)}\$",
          ),
          //${total.toStringAsFixed(2)}
          const SizedBox(height: 4),
          _buildInfoRow("Nombre de transactions :", numberOfExpense.toString()),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          //flex: 3,
          child: Text(
            label,
            overflow: TextOverflow.ellipsis,
            // Empêche de casser la ligne si le label est long
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColors.textSecondary,
            ),
          ),
        ),
        Expanded(
          //flex: 1,
          child: Text(
            textAlign: TextAlign.center,
            value,
            style: TextStyle(
              fontSize: 18,
              color: AppColors.textSuccess,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        const SizedBox(width: 70),
        //pour eviter que le floating button masque le montant
      ],
    );
  }
}
