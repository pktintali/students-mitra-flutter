import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:students_mitra_flutter/providers/SelectedSub.dart';
import 'package:students_mitra_flutter/providers/SheetQuestions.dart';

class QuestionMaker2 extends StatelessWidget {
  final SelectedSub sub;
  final ScrollController _controller = ScrollController();

  QuestionMaker2({this.sub});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                'https://www.studentmitra.in/static/media/logo5.8b645828.png',
              ),
              scale: 2,
            ),
          ),
          child: SingleChildScrollView(
            controller: _controller,
            child: Consumer<SheetQuestions>(
              builder: (context, qData, __) => qData.qdb.length > 0
                  ? AnimatedContainer(
                      curve: Curves.easeInBack,
                      transform: Matrix4.rotationY(qData.marg),
                      // margin: EdgeInsets.all(qData.marg),
                      onEnd: () {
                        qData.setMargin(value: 0);
                      },
                      duration: Duration(milliseconds: 400),
                      child: Column(
                        children: [
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                icon: Icon(Icons.menu),
                                onPressed: () {},
                                color: Colors.white,
                              ),
                              Container(
                                // height: 60,
                                // width: 60,
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  gradient: LinearGradient(colors: [
                                    Colors.orange,
                                    Colors.yellowAccent.shade400,
                                  ]),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Text(
                                    '${qData.i + 1}/10',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.info,
                                ),
                                onPressed: () {},
                                color: Colors.white,
                                iconSize: 28,
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.rectangle,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 15.0,
                                  vertical: 30,
                                ),
                                child: Center(
                                  child: Text(
                                    qData.qdb[qData.i].question,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 15),
                          Container(
                            height: 500,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(50),
                                topRight: Radius.circular(50),
                              ),
                            ),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 25,
                                ),
                                Text(
                                  'Select the correct answer',
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 5),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Card(
                                          elevation: 2.5,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(7)),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(18.0),
                                            child: Container(
                                              child: Center(
                                                child: Text(
                                                    qData.qdb[qData.i].opt1),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 5),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Card(
                                          elevation: 2.5,
                                          shape: RoundedRectangleBorder(
                                            side: BorderSide(
                                              color: Colors.red,
                                              width: 2.0,
                                            ),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(7)),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(18.0),
                                            child: Center(
                                              child:
                                                  Text(qData.qdb[qData.i].opt2),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                qData.qdb[0].opt3.length > 0
                                    ? Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 5),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Card(
                                                elevation: 2.5,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(7)),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                      18.0),
                                                  child: Center(
                                                      child: Text(qData
                                                          .qdb[qData.i].opt3)),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    : Container(),
                                qData.qdb[0].opt4.length > 0
                                    ? Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 5),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Card(
                                                elevation: 2.5,
                                                shape: RoundedRectangleBorder(
                                                  side: BorderSide(
                                                    color: Colors.green,
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(7)),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                      18.0),
                                                  child: Center(
                                                      child: Text(qData
                                                          .qdb[qData.i].opt4)),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    : Container(),
                                SizedBox(
                                  height: 10,
                                ),
                                FlatButton(
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                      color: Colors.green,
                                      width: qData.i < 9 ? 1.5 : 2.5,
                                    ),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50)),
                                  ),
                                  onPressed: () async {
                                    if (qData.i < 9) {
                                      qData.setMargin(value: 1.6);
                                      await Future.delayed(
                                        Duration(milliseconds: 400),
                                      );
                                    }
                                    qData.increment();
                                    _controller.jumpTo(0);
                                  },
                                  child: Text(
                                    qData.i < 9 ? 'Next' : 'Submit',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  : Center(
                      heightFactor: 18,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.white,
                        ),
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
