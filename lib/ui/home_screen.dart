import 'package:flutter/material.dart';
import 'package:graph_implementation/custom_widgets/custom_text.dart';
// import 'package:flutter/services.dart';
import 'package:graph_implementation/providers/home_viewmodel.dart';
import 'package:graph_implementation/utilities/graph_asset.dart';
import 'package:stacked/stacked.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      onModelReady: (model) => model.readData(),
      viewModelBuilder: () => HomeViewModel(),
      builder: (context,model,child) => Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              children: [
                Container(
                  height: 154,
                  // width: 329,
                  padding: const EdgeInsets.only(top: 30),
                  decoration: BoxDecoration(
                    color: Colors.white,
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
                    )
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
                  // width: 329,
                  padding: const EdgeInsets.only(top: 30),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(image: AssetImage(
                      GraphAssets.purpleGraph
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
                    )
                    // Image.asset(GraphAssets.blueGraph),
                    // Padding(
                    //   padding: const EdgeInsets.only(top: 8.0),
                    //   child: CustomText.headline('125'),
                    // )
                    
                  ]),
                ),
                
              ],
            ),
          ),
        ),
      ),
    );
  }

}
