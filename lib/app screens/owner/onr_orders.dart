import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../widgets/underconstruction.dart';

class OwnerOrders extends StatefulWidget {
  const OwnerOrders({Key? key}) : super(key: key);

  @override
  _OwnerOrdersState createState() => _OwnerOrdersState();
}

class _OwnerOrdersState extends State<OwnerOrders> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 500,
        child:
            //  underConstruction(context),
            SfCartesianChart(
                primaryXAxis: CategoryAxis(),
                // Chart title
                title: ChartTitle(text: 'Monthly Covid-19 Infections'),
                // Enable legend
                legend: Legend(isVisible: true),
                // Enable tooltip
                tooltipBehavior: TooltipBehavior(enable: true),
                series: <ChartSeries<_Infections, String>>[
              LineSeries<_Infections, String>(
                  dataSource: <_Infections>[
                    _Infections('Jan', 35000),
                    _Infections('Feb', 28000),
                    _Infections('Mar', 34000),
                    _Infections('Apr', 32000),
                    _Infections('May', 40000),
                    _Infections('Jun', 60000)
                  ],
                  xValueMapper: (_Infections victims, _) => victims.year,
                  yValueMapper: (_Infections victims, _) => victims.victims,
                  // Enable data label
                  dataLabelSettings: DataLabelSettings(isVisible: true))
            ]));
  }
}

class _Infections {
  _Infections(this.year, this.victims);

  final String year;
  final double victims;
}
