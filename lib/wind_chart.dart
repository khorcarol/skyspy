import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:skyspy/stargazing_series.dart';

class WindChart extends StatelessWidget {
  final List<SubscriberSeries> data = [
    SubscriberSeries(
      year: "2008",
      subscribers: 2,
      barColor: charts.ColorUtil.fromDartColor(const Color.fromARGB(255, 186, 183, 195)),
    ),
    SubscriberSeries(
      year: "2009",
      subscribers: 5,
      barColor: charts.ColorUtil.fromDartColor(const Color.fromARGB(255, 186, 183, 195)),
    ),
    SubscriberSeries(
      year: "2010",
      subscribers: 2,
      barColor: charts.ColorUtil.fromDartColor(const Color.fromARGB(255, 186, 183, 195)),    
      ),
    SubscriberSeries(
      year: "2011",
      subscribers: 4,
      barColor: charts.ColorUtil.fromDartColor(const Color.fromARGB(255, 186, 183, 195)),    
      ),
    SubscriberSeries(
      year: "2012",
      subscribers: 7,
      barColor: charts.ColorUtil.fromDartColor(const Color.fromARGB(255, 186, 183, 195)),    
      ),
    SubscriberSeries(
      year: "2013",
      subscribers: 6,
      barColor: charts.ColorUtil.fromDartColor(const Color.fromARGB(255, 186, 183, 195)),    
      ),
    SubscriberSeries(
      year: "2014",
      subscribers: 3,
      barColor: charts.ColorUtil.fromDartColor(const Color.fromARGB(255, 186, 183, 195)),    
      ),
    SubscriberSeries(
      year: "2015",
      subscribers: 3,
      barColor: charts.ColorUtil.fromDartColor(const Color.fromARGB(255, 186, 183, 195)),    
      ),
    SubscriberSeries(
      year: "2016",
      subscribers: 8,
      barColor: charts.ColorUtil.fromDartColor(const Color.fromARGB(255, 186, 183, 195)),    
      )
      ,
    SubscriberSeries(
      year: "2017",
      subscribers: 5,
      barColor: charts.ColorUtil.fromDartColor(const Color.fromARGB(255, 186, 183, 195)),    
      ),
    SubscriberSeries(
      year: "2018",
      subscribers: 4,
      barColor: charts.ColorUtil.fromDartColor(const Color.fromARGB(255, 186, 183, 195)),    
      ),
    SubscriberSeries(
      year: "2019",
      subscribers: 1,
      barColor: charts.ColorUtil.fromDartColor(const Color.fromARGB(255, 186, 183, 195)),    
      ),
  ];

  WindChart({super.key});

  // SubscriberChart({required this.data});

  @override
  Widget build(BuildContext context) {
    List<charts.Series<SubscriberSeries, String>> series = [
      charts.Series(
        id: "Subscribers",
        data: data,
        domainFn: (SubscriberSeries series, _) => series.year,
        measureFn: (SubscriberSeries series, _) => series.subscribers,
        colorFn: (SubscriberSeries series, _) => series.barColor)
    ];

    return Container(
      height: 95,
      color:const Color.fromARGB(255, 86, 78, 121),
      margin: const EdgeInsets.all(00),
      padding: const EdgeInsets.all(0.0),
      alignment: Alignment.bottomCenter,
      child: charts.BarChart(
        series, 
        animate: true,
        primaryMeasureAxis:
          const charts.NumericAxisSpec(renderSpec: charts.NoneRenderSpec()),

        /// This is an OrdinalAxisSpec to match up with BarChart's default
        /// ordinal domain axis (use NumericAxisSpec or DateTimeAxisSpec for
        /// other charts).
        domainAxis: const charts.OrdinalAxisSpec(
            // Make sure that we draw the domain axis line.
            showAxisLine: false,
            // But don't draw anything else.
            renderSpec: charts.NoneRenderSpec()),
        ),
    );
  }
}
