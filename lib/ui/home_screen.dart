import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:graph_implementation/custom_widgets/custom_text.dart';
import 'dart:developer';
import 'package:graph_implementation/providers/home_viewmodel.dart';
import 'package:graph_implementation/utilities/graph_asset.dart';
import 'package:stacked/stacked.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // List<CategoryBarChartModel> chartData = [
    //   CategoryBarChartModel(category: 'Owo', y: 7),
    //   CategoryBarChartModel(category: 'Ose', y: 7),
    //   CategoryBarChartModel(category: 'Ondo West', y: 6),
    //   // CategoryBarChartModel(category: 'Ondo West', x: 3),
    //   // CategoryBarChartModel(category: 'Ondo West', x: 3),
    //   // CategoryBarChartModel(category: 'Ondo West', x: 3),
    //   CategoryBarChartModel(category: 'Ondo East', y: 4),
    //   CategoryBarChartModel(category: 'Okitipupa', y: 5),
    //   CategoryBarChartModel(category: 'Odigbo', y: 8),
    //   CategoryBarChartModel(category: 'Irele', y: 7),
    //   CategoryBarChartModel(category: 'Ile Oluji/Oke Igbo', y: 6),
    //   CategoryBarChartModel(category: 'Ilaje', y: 5),
    //   CategoryBarChartModel(category: 'Ifedore', y: 2),
    //   CategoryBarChartModel(category: 'Idanre', y: 3),
    //   CategoryBarChartModel(category: 'Ese Odo', y: 5),
    //   CategoryBarChartModel(category: 'Akure North', y: 7),
    //   CategoryBarChartModel(category: 'Akoko S/W', y: 5),
    //   CategoryBarChartModel(category: 'Akoko S/E', y: 6),
    //   CategoryBarChartModel(category: 'Akoko N/W', y: 4),
    //   CategoryBarChartModel(category: 'Akoko N/E', y: 5),
    //   CategoryBarChartModel(category: 'Akure South', y: 5),
    // ];
    return ViewModelBuilder<HomeViewModel>.reactive(
      onModelReady: (model) => model.readData(),
      viewModelBuilder: () => HomeViewModel(),
      builder: (context,model,child) => Scaffold(
        body: model.occupationTypeChartData.isNotEmpty&&model.widowsAgeAtBereavementChartData.isNotEmpty?SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 154,
                  // width: 329,
                  padding: const EdgeInsets.only(top: 30),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(1,1),
                          color: const Color(0xFF717171).withOpacity(0.20),
                        ),
                        BoxShadow(
                          offset: const Offset(-1,-1),
                          color: const Color(0xFF717171).withOpacity(0.20),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(image: AssetImage(
                          GraphAssets.blueGraph
                      ))
                  ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText.body('TOTAL NUMBER OF WIDOWS REGISTERED'),
                              Image.asset(GraphAssets.profileImage,
                                // width: MediaQuery.of(context).size.width/3,
                                // height: MediaQuery.of(context).size.height/8,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 32.0),
                          child: CustomText.headline('${model.graphDataList.map<String>((e) => e.lga??'').toList().length}'),
                        ),
                        // Image.asset(GraphAssets.blueGraph),
                        // Padding(
                        //   padding: const EdgeInsets.only(top: 8.0),
                        //   child: CustomText.headline('125'),
                        // )

                      ]),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 24,bottom: 32),
                  height: 154,
                  width: 329,
                  padding: const EdgeInsets.only(top: 30),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(image: AssetImage(
                          GraphAssets.purpleGraph
                      )),
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(1,1),
                          color: const Color(0xFF717171).withOpacity(0.20),
                        ),
                        BoxShadow(
                          offset: const Offset(-1,-1),
                          color: const Color(0xFF717171).withOpacity(0.20),
                        ),
                      ]
                  ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText.body('SELECT LOCAL GOVERNMENT'),
                              Image.asset(GraphAssets.homeIconImage,
                                // width: MediaQuery.of(context).size.width/3,
                                // height: MediaQuery.of(context).size.height/8,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 32.0),
                          child: CustomText.headline('${model.graphDataList.map<String>((e) => e.lga??'').toSet().length}'),
                        ),
                        // Image.asset(GraphAssets.blueGraph),
                        // Padding(
                        //   padding: const EdgeInsets.only(top: 8.0),
                        //   child: CustomText.headline('125'),
                        // )


                      ]),
                ),
                SizedBox(
                  height: 650,
                  width: MediaQuery.of(context).size.width-68,
                  child: Material(
                    borderRadius: BorderRadius.circular(5.43),
                    elevation: 1,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24,),
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(bottom: 16.0,top: 24),
                            child: Text('WIDOWS REGISTERED BY LOCAL GOVERNMENT'),
                          ),
                          Expanded(
                            child: RotatedBox(
                              quarterTurns: -3,
                              child: BarChart(
                                BarChartData(
                                  borderData: FlBorderData(show: false,),
                                  // alignment: BarChartAlignment.center,
                                  // groupsSpace: 30,
                                  titlesData: FlTitlesData(
                                    leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                                    topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                                    rightTitles: AxisTitles(sideTitles: SideTitles(interval: getGreatestValue(model.widowsAgeAtBereavementChartData).toDouble()/8,reservedSize: 90,getTitlesWidget: (value,meta) {
                                      // log('${chartData[0]}');
                                      return RotatedBox(
                                          quarterTurns: -5,
                                          child: Text('${value.toInt()}',textAlign: TextAlign.end,
                                            style: const TextStyle(
                                              fontSize: 12,
                                            ),));
                                    },showTitles: true)),
                                    bottomTitles: AxisTitles(
                                      // axisNameWidget: Text('WIDOWS REGISTERED BY LOCAL GOVERNMENT'),
                                        sideTitles: SideTitles(reservedSize: 100,getTitlesWidget: (value,meta) {
                                          // log('${chartData[0]}');
                                          return RotatedBox(
                                              quarterTurns: -5,
                                              child: Text('${model.widowsAgeAtBereavementChartData[value.toInt()].category} - ',textAlign: TextAlign.end,
                                                style: const TextStyle(
                                                  fontSize: 12,
                                                ),));
                                        },showTitles: true)),
                                    show: true,
                                  ),
                                  // maxY: 6,
                                  // minY: 1,
                                  // baselineY: 0,
                                  barGroups: model.widowsAgeAtBereavementChartData.map<BarChartGroupData>((e) =>  BarChartGroupData(x: model.widowsAgeAtBereavementChartData.indexOf(e),
                                    barRods: [
                                      BarChartRodData(
                                          backDrawRodData: BackgroundBarChartRodData(
                                              color: const Color(0xFF602BF8).withOpacity(0.1),
                                              fromY: getGreatestValue(model.widowsAgeAtBereavementChartData).toDouble(),
                                              show: true),
                                          toY: e.y.toDouble(),
                                          width: 10,
                                          color: const Color(0xFF602BF8),
                                          borderRadius: BorderRadius.circular(0)),
                                    ],
                                  ),).toList(),
                                ),
                                swapAnimationDuration: const Duration(milliseconds: 150), // Optional
                                swapAnimationCurve: Curves.linear, // Optional
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                   SizedBox(
                  height: 650,
                  width: MediaQuery.of(context).size.width-32,
                  child: Material(
                    borderRadius: BorderRadius.circular(5.43),
                    elevation: 1,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24,),
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(bottom: 16.0,top: 24),
                            child: Text('WIDOWS TYPE OF OCCUPATION'),
                          ),
                          Expanded(
                            child: BarChart(
                              BarChartData(
                                borderData: FlBorderData(show: false,),
                                // alignment: BarChartAlignment.center,
                                // groupsSpace: 30,
                                titlesData: FlTitlesData(
                                  rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                                  topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                                  leftTitles: AxisTitles(sideTitles: SideTitles(interval: getGreatestValue(model.occupationTypeChartData).toDouble()/7,reservedSize: 90,getTitlesWidget: (value,meta) {
                                    // log('${chartData[0]}');
                                    return Text('${value.toInt()}   - ',textAlign: TextAlign.end,
                                      style: const TextStyle(
                                        fontSize: 12,
                                      ),);
                                  },showTitles: true)),
                                  bottomTitles: AxisTitles(
                                    // axisNameWidget: Text('WIDOWS REGISTERED BY LOCAL GOVERNMENT'),
                                      sideTitles: SideTitles(reservedSize: 180,getTitlesWidget: (value,meta) {
                                        // log('${chartData[0]}');
                                        return Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: SizedBox(
                                            width: 30,
                                            // height: 50,
                                            child: Text('${model.occupationTypeChartData[value.toInt()].category} - ',textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                fontSize: 12,
                                              ),),
                                          ),
                                        );
                                      },showTitles: true)),
                                  show: true,
                                ),
                                // maxY: 6,
                                // minY: 1,
                                // baselineY: 0,
                                barGroups: model.occupationTypeChartData.map<BarChartGroupData>((e) =>  BarChartGroupData(x: model.occupationTypeChartData.indexOf(e),
                                  barRods: [
                                    BarChartRodData(
                                        backDrawRodData: BackgroundBarChartRodData(
                                            color: const Color(0xFF039CDD).withOpacity(0.1),
                                            fromY: getGreatestValue(model.occupationTypeChartData).toDouble(),
                                            show: true),
                                        toY: e.y.toDouble(),
                                        width: 15,
                                        color: const Color(0xFF039CDD),
                                        borderRadius: BorderRadius.circular(0)),
                                  ],
                                ),).toList(),
                              ),
                              swapAnimationDuration: const Duration(milliseconds: 150), // Optional
                              swapAnimationCurve: Curves.linear, // Optional
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ): const Center(child: CircularProgressIndicator()),
      ),
    );
  }
  double getGreatestValue(List<CategoryBarChartModel> chartData){
    List<double> listVal = chartData.map<double>((e) => e.y.toDouble()).toList();
    listVal.sort();
    // log('length: ${listVal.toSet().length}\n lastVal: ${listVal.last}\nFirstVal: ${listVal.first}');
    return listVal.last;
  }
}
class CategoryBarChartModel{
  String category;
  double y;
  CategoryBarChartModel({required this.category,required this.y});
  @override
  String toString() {
    // TODO: implement toString
    return """
    category: $category,
    x: $y""";
  }
}