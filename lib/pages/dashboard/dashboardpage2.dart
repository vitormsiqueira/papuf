import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_date_picker_timeline/flutter_date_picker_timeline.dart';
import 'package:papuf/widgets/text_appbar.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

import '../../color_hex.dart';

class DashboardPage2 extends StatefulWidget {
  @override
  _DashboardPage2State createState() => _DashboardPage2State();
}

class _DashboardPage2State extends State<DashboardPage2> {
   // Variáveis responsável por fazer a "paginação" de informações da list Salas de Aulas
  bool pressed = false;


  @override
  Widget build(BuildContext context) {

    

    return DefaultTabController(
      length: 3, 
      child: Scaffold(
        appBar: AppBar(
          brightness: Brightness.dark, // status bar brightness
          title: textAppBar("Dashboard", color: false),
          elevation: 0,
          backgroundColor: hexToColor("#4163CD"),
          
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(53.0), // altura é de 48+5 do padding bottom na linha abaixo
            
            child: Container(
              padding: EdgeInsets.only(left: 85, right: 85, bottom: 10, top: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              height: 50,
              child: TabBar(
                
                unselectedLabelColor: Colors.white,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: hexToColor("#4DE4B2"),
                 
                ),
                labelColor: Colors.white,
                tabs: [
                  Tab(
                    child:  Align(
                        child: Text("Dia", style: TextStyle(fontSize: 18),),
                        alignment: Alignment.center,
                      ),
                    
                  ),
                  Tab(
                    child: Align(
                      child: Text("Mês", style: TextStyle(fontSize: 18),),
                      alignment: Alignment.center,
                    ),
                  ),
                   Tab(
                    child: Align(
                      child: Text("Ano", style: TextStyle(fontSize: 18),),
                      alignment: Alignment.center,
                    ),
                  ),
                ],
              ),
            ),
          )
        ),
        body: TabBarView(
          children: [
            _tabDia(context),
            _tabMes(),
            _tabAno()
          ],
        ),
      )
    );
  }



  _tabDia(BuildContext context) {
    final List<SalesData> chartData = [
      SalesData(1, 15),
      SalesData(2, 28),
      SalesData(3, 34),
      SalesData(4, 32),
      SalesData(5, 20),
      SalesData(6, 35),
      SalesData(7, 38),
      SalesData(8, 34),
      SalesData(9, 36),
      SalesData(10, 29),
      SalesData(11, 32),
      SalesData(12, 28),
      SalesData(13, 34),
      SalesData(14, 39),
      SalesData(15, 19)
  ];
    return Container(
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(0), // necessário ser 0, p/ o gráfico atingir as bordas
          child: Stack(
            children: [
              Column( // Define o tamnho e cor dos containers de fundo
                children: [
                  Container(
                    height: 500,
                    color: hexToColor("#4163CD"),
                  ),
                  Container(
                    height: 620,
                    color: Colors.white,
                  )
                ],
              ),
              Container( // Calendário dinâmico
                alignment: Alignment.topCenter,
                padding: const EdgeInsets.only(top: 15, bottom: 20, left: 10),
                child: FlutterDatePickerTimeline(
                  startDate: DateTime(2021, 01, 01),
                  endDate: DateTime.now(),
                  initialFocusedDate: DateTime.now(),
                  initialSelectedDate: DateTime.now(),
                  selectedItemBackgroundColor: hexToColor("#3B53C9"),
                  unselectedItemBackgroundColor: Colors.transparent,
                  selectedItemTextStyle: TextStyle(color: Colors.white),
                  unselectedItemTextStyle: TextStyle(color: Colors.white70),
                  itemRadius: 14,
                  selectedItemWidth: 150,
                  onSelectedDateChange: (DateTime dateTime) {
                    print(dateTime);
                  },
                )
              ),
              Container( // Texto Consumo
                alignment: Alignment.topCenter,
                padding: EdgeInsets.only(top: 70),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text("Consumo", 
                        style: TextStyle(
                          fontSize: 22.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ] 
                ),
              ),
              Container( // Informações de consumo e escolha de sala
                alignment: Alignment.topCenter,
                padding: EdgeInsets.only(top: 90),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [ 
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("410", 
                              style: TextStyle(
                                fontSize: 72.0,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top:30.0), // deixa o "KWH" alinhado na base do valor do consumo
                              child: Text("KWH", 
                                style: TextStyle(
                                  fontSize: 24.0,
                                  color: Colors.white54,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            onPressed: (){
                            },
                            icon: Icon(
                              Icons.arrow_drop_up,  // Add this
                              color: Colors.white,
                              size: 35.0,
                            )
                          ),
                          Container(
                            child: Text(
                              "Sala 12", 
                              style: TextStyle(
                                fontSize: 19.0,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: (){
                            },
                            icon: Icon(
                              Icons.arrow_drop_down,  // Add this
                              color: Colors.white,
                              size: 35.0,
                            )
                          ),
                        ],
                      ),
                    ]
                  ),
                ),
              ),
              Container( // Gráfico interativo
                alignment: Alignment.topCenter,
                padding: EdgeInsets.only(top: 220),
                child: AspectRatio(
                  aspectRatio: 1.70,
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(0),
                      child: LineChart(
                        mainData(),
                      ),
                    ),
                  ),
                ),
              ),
              Container( // Cards de ares ligados
                alignment: Alignment.topCenter,
                padding: EdgeInsets.only(top: 450),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 180,
                      width: MediaQuery.of(context).size.width-40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 10.0,
                          )
                        ]
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.all(20),
                            child: CircularPercentIndicator(
                              backgroundColor: Colors.grey[200],
                              radius: 120.0,
                              lineWidth: 11.0,
                              animation: true,
                              percent: 0.48,
                              center: Text(
                                "14",
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                              ),
                              circularStrokeCap: CircularStrokeCap.round,
                              progressColor: hexToColor("#4163CD"),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(20),
                            child: Text(
                              "Ares Ligados", 
                              style: TextStyle(
                                fontSize: 19.0,
                                color: hexToColor("#4163CD"),
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container( // Outros cards
                alignment: Alignment.topCenter,
                padding: EdgeInsets.only(top: 655),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 20, right: 20),
                      height: 250,
                      width: MediaQuery.of(context).size.width-40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 10.0,
                          )
                        ]
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: SfCartesianChart(
                          borderWidth: 0,
                          plotAreaBorderWidth: 0.0,
                          enableAxisAnimation: false,
                          selectionType: SelectionType.cluster,
                          series: <ChartSeries>[
                              ColumnSeries<SalesData, double>(
                                dataSource: chartData,
                                isTrackVisible: true,
                                xValueMapper: (SalesData sales, _) => sales.year,
                                yValueMapper: (SalesData sales, _) => sales.sales,
                                // Sets the corner radius
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                                trackColor: Colors.grey[100],
                                color: hexToColor("#4163CD"),
                                isVisibleInLegend: true,
                                width: .5
                              )
                          ]
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container( // Outros cards
                alignment: Alignment.topCenter,
                padding: EdgeInsets.only(top: 910),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.all(20),
                      height: 225,
                      width: MediaQuery.of(context).size.width/2-30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 10.0,
                          )
                        ]
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20, right: 20, bottom: 20),
                      height: 225,
                      width: MediaQuery.of(context).size.width/2-30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 10.0,
                          )
                        ]
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  LineChartData mainData() {
    return LineChartData(
      titlesData: FlTitlesData(
        show: false,
        leftTitles: SideTitles(
          showTitles: false,
        ),
       
      ),
      borderData: FlBorderData(show: false, border: Border.all(color: Colors.white, width: 0)),
      minX: 0,
      maxX: 11,
      minY: 1,
      maxY: 5,
      lineBarsData: [
        LineChartBarData(
          spots: [
            FlSpot(0, 3.7),
            FlSpot(2.0, 3.2),
            FlSpot(4.5, 4.3),
            FlSpot(6.3, 3.7),
            FlSpot(8, 4.6),
            FlSpot(9.5, 2.2),
            FlSpot(10.5, 3),
          ],
          isCurved: true,
          colors: [Colors.blueAccent.withOpacity(0.35)],
          barWidth: 5,
          dotData: FlDotData(
            show: false,
          ),
        ),
        LineChartBarData(
          spots: [
            FlSpot(0, 3),
            FlSpot(2.1, 2.1),
            FlSpot(4.5, 4.9),
            FlSpot(6.3, 3.1),
            FlSpot(8, 4),
            FlSpot(9.5, 3),
            FlSpot(10.5, 5.1),
          ],
          isCurved: true,
          colors: [Colors.white,],
          barWidth: 5,
          dotData: FlDotData(
            show: false,
          )
        ),
        
      ],
    );
  }
}

class SalesData {
  SalesData(this.year, this.sales);
  final double year;
  final double sales;
}


_tabMes() {
  return Container(
    color: Colors.lightGreenAccent,
  );
}

_tabAno() {
  return Container(
    color: Colors.lightBlueAccent,
  );
}