
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../shared_components/appbar_container.dart';

class RevealingRanksScreen extends StatelessWidget {
  const RevealingRanksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppbarContainer(
            title: AppLocalizations.of(context)!.payroll,
          ),
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                _buildRow(AppLocalizations.of(context)!.salary, '653'),
                const SizedBox(height: 8),
                _buildRow(AppLocalizations.of(context)!.deductions, '65'),
                const SizedBox(height: 8),
                _buildRow(AppLocalizations.of(context)!.entitlements, '00'),
                const SizedBox(height: 8),
                _buildRow(AppLocalizations.of(context)!.date, '2 - 3 - 2025'),
                const SizedBox(height: 12),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  [
                      Text(
                        AppLocalizations.of(context)!.net_salary,
                        style:const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const Text(
                        '818',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRow(String title, String value) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: const TextStyle(fontSize: 16)),
            Text(value, style: const TextStyle(fontSize: 16)),
          ],
        ),
        Divider(color: Colors.grey[300],),

      ],
    );
  }
}