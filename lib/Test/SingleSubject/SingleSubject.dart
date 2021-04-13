import 'package:provider/provider.dart';
import 'package:students_mitra_flutter/Test/2QuestionMaker.dart';
import 'package:students_mitra_flutter/Test/SingleSubject/SubContainer.dart';
import 'package:students_mitra_flutter/providers/SelectedSub.dart';
import 'package:students_mitra_flutter/providers/SheetQuestions.dart';
import 'package:students_mitra_flutter/providers/SheetSubjects.dart';
import 'package:floating_text/floating_text.dart';
import 'package:flutter/material.dart';
import 'package:students_mitra_flutter/providers/UnitSubjectData.dart';

class SingleSubject extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return ChangeNotifierProvider(
      create: (_) => SelectedSub(),
      child: Scaffold(
        bottomSheet: bottomSheet(),
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text(
            "Single Subject Test",
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Flexible(
              child: Consumer<SheetSubjects>(
                builder: (context, sheetSub, __) => sheetSub.db.length > 0
                    ? GridView.builder(
                        itemCount: sheetSub.db.length,
                        physics: BouncingScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount:
                                (orientation == Orientation.portrait) ? 2 : 4),
                        itemBuilder: (BuildContext context, int index) {
                          final subData = UnitSubjectData(
                              fullName: sheetSub.db[index].fullName,
                              shortName: sheetSub.db[index].shortName);
                          return SubContainer(
                            subData: subData,
                          );
                        },
                      )
                    : Center(
                        child: CircularProgressIndicator(),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget bottomSheet() {
    return Row(
      children: [
        Expanded(
          child: Consumer<SelectedSub>(
            builder: (context, config, __) => Consumer<SheetQuestions>(
              builder: (context, data, __) => FlatButton(
                height: 60,
                onPressed: () async {
                  data.withToTimer = MediaQuery.of(context).size.width;
                  data.resetQDB();
                  if (config.shortName!=null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => QuestionMaker2(sub: config),
                      ),
                    );
                    await data.getQuestions(subject: config.shortName);
                  }
                },
                color: config.shortName!=null ? Colors.red : Colors.grey,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: FloatingText(
                    text: config.shortName!=null
                        ? "Start " + config.shortName
                        : "Select a Subject",
                    repeat: true,
                    floatingSpeed: 6,
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                    floatingTextStyle: TextStyle(
                      color: Colors.lightBlueAccent,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
