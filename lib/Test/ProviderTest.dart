import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:students_mitra_flutter/providers/UserData.dart';

class ProviderTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider Test'),
      ),
      body: Consumer<UserData>(
        builder: (context, userData, child) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Center(child: Text('Active Subjects')),
              Column(
                children: userData.activeSub != null
                    ? userData.activeSub
                        .map(
                          (e) => Row(
                            children: [
                              Expanded(
                                child: Card(
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Center(child: Text(e)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                        .toList()
                    : [],
              ),
              RaisedButton(
                onPressed: () async {
                  await userData.fetchActiveSub();
                },
                child: Text('Refresh'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
