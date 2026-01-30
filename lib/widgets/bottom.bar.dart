import 'package:flutter/material.dart';
import 'package:gestion_budget/shares/colors/app.colors.dart';

class BottomBars extends StatelessWidget {
  const BottomBars({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: AppColors.secondary,
      shape: const CircularNotchedRectangle(), //ajoute encoche
      notchMargin: 8.0, //espace entre button flotant et les bords
      child: Column(
        mainAxisSize: MainAxisSize.min, //ne pas prendre tout ecran
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildInfoRow("Total des dépenses :", " 0.00\$"),
          //${total.toStringAsFixed(2)}
          const SizedBox(height: 4),
          _buildInfoRow("Nombre de transactions :", "0"),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Text(
            label,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.textSecondary,
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Text(
            value,
            style: TextStyle(fontSize: 18, color: AppColors.textSuccess, fontWeight: FontWeight.w800),
          ),
        ),
        const SizedBox(width: 50),
        //pour eviter que le floating button masque le montant
      ],
    );
  }
}
