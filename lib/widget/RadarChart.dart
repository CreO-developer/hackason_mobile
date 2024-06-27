import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:mobile/domain/entities/scores.dart';
import 'package:mobile/widget/RadarChartDataFixMinMaxWidget.dart';

class RadarChartWidget extends StatelessWidget {
  final Scores scores;

  const RadarChartWidget({super.key, required this.scores});

  @override
  Widget build(BuildContext context){

    final evaluateTheme = [
      '開発者の主観',
      '人数',
      'はみ出し度',
      '枠内の密度',
      '表情'
    ];
    return  RadarChart(
        RadarChartDataFixMinMax(
          min: RadarEntry(value: 0),
          max: RadarEntry(value: 100),
          dataSets: [
            RadarDataSet(
              dataEntries: [
                RadarEntry(value: scores.originalScore.toDouble()),
                RadarEntry(value: scores.peopleScore.toDouble()),
                RadarEntry(value: scores.includeScore.toDouble()),
                RadarEntry(value: scores.excludeScore.toDouble()),
                RadarEntry(value: scores.faceScore?.toDouble() ?? 0),
              ],
              fillColor: Color(0x002D6486),
              borderColor: Color(0xFFFA2A2A),
              borderWidth: 6,
              entryRadius: 0,
            ),
          ],
          radarBorderData: BorderSide(color: Color(0xff2D6486), width: 3),
          radarShape: RadarShape.polygon,
          borderData: FlBorderData(show: false),
          getTitle: (index, angle){ // 各軸に文字列を表示
            return RadarChartTitle(text: evaluateTheme[index]);
          },
          titleTextStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xff001623)),
          ticksTextStyle: TextStyle(color: Color(0x002D6486)),
          tickCount: 4,
          tickBorderData: const BorderSide(color: Color(0x402D6486),width: 1),
          gridBorderData: const BorderSide(color: Color(0xFFFFB800), width: 1),
        ),
    );
  }
}
