import 'package:bacancy/infra/model/data.dart';
import 'package:bacancy/state/bacancy_cubit.dart';
import 'package:bacancy/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<BacancyCubit>(context).fetchData();
    final orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      backgroundColor: Styles.backgroundColor,
      body: BlocBuilder<BacancyCubit, BacancyState>(
        builder: (context, state) {
          if (!(state is BacancyLoaded))
            return Center(
              child: CircularProgressIndicator(),
            );
          final data = (state as BacancyLoaded).data;
          return SafeArea(
            child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    ListView(
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        buildAppBar(context),
                        SizedBox(
                          height: 30,
                        ),
                        buildList(context, orientation, data),
                        SizedBox(height: 50,)
                      ],
                    ),
                    buildAddButton(context)
                  ],
                )),
          );
        },
      ),
    );
  }

  Widget buildAddButton(BuildContext context) {
    return Positioned(
        right: 15,
        top: 75,
        child: InkWell(
          onTap: () {
            _showMyDialog(context);
          },
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Styles.addButtonColor,
            ),
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ));
  }

  Widget buildList(
      BuildContext context, Orientation orientation, List<Data> payLoad) {
    return Container(
      height: MediaQuery.of(context).size.height * .85,
      child: GridView.builder(
        shrinkWrap: true,
        // physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: (orientation == Orientation.portrait) ? 2 : 3),
        itemCount: payLoad.length,
        itemBuilder: (context, index) {
          print('data length ${payLoad.length}');
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Container(
                height: MediaQuery.of(context).size.height * .15,
                width: MediaQuery.of(context).size.width * .30,
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Card(
                    color: Styles.tileColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                              alignment: Alignment.topLeft,
                              child: Icon(
                                Icons.favorite,
                                color: payLoad[index].favorite
                                    ? Colors.red
                                    : Colors.white,
                              )),
                          Align(
                              alignment: Alignment.bottomRight,
                              child: Text(
                                payLoad[index].name[0],
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Styles.semiMidFont),
                              )),
                        ],
                      ),
                    )),
              ),
              Text(payLoad[index].name)
            ],
          );
        },
      ),
    );
  }

  Widget buildAppBar(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        height: MediaQuery.of(context).size.height * .13,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            'Projects',
            style: TextStyle(
                fontSize: Styles.heavy,
                color: Styles.fontActive,
                fontWeight: FontWeight.bold),
          ),
        ));
  }

  Future<void> _showMyDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      color: Styles.tick,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Center(
                    child: FaIcon(
                      FontAwesomeIcons.check,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Success!',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Project Created Successfully',
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                      height: 35,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Styles.addButtonColor,
                      ),
                      child: Center(
                          child: Text(
                        'OK',
                        style: TextStyle(color: Colors.white),
                      ))),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
