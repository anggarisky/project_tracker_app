import 'package:flutter/material.dart';
import 'package:trello_like_mobile_app/data/tasks.dart';
import 'package:trello_like_mobile_app/model/task.dart';
import 'package:trello_like_mobile_app/styles/color.dart';
import 'package:trello_like_mobile_app/styles/typo.dart';

class BrowseTask extends StatefulWidget {
  @override
  State<BrowseTask> createState() => _BrowseTaskState();
}

class _BrowseTaskState extends State<BrowseTask> {
  List<Task> tasks = [];
  @override
  void initState() {
    super.initState();
    tasks = getTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: softwhite,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: white,
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  top: 60,
                  left: 24,
                  right: 24,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Workspace',
                      style: medium,
                    ),
                    SizedBox(height: 6),
                    Row(
                      children: [
                        Image.asset(
                          'assets/logo.png',
                          height: 40,
                        ),
                        SizedBox(
                          width: 14,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Glory Future',
                              style: header,
                            ),
                            Text(
                              '123 people',
                              style: small,
                            ),
                          ],
                        ),
                        Spacer(),
                        IconButton(
                          onPressed: () {},
                          icon: Image.asset('assets/ic_down.png', height: 24),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Container(
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(20),
                ),
                width: double.infinity,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                        left: 20,
                        right: 20,
                        top: 10,
                        bottom: 10,
                      ),
                      width: double.infinity,
                      child: Row(
                        children: [
                          Text(
                            'Backlog',
                            style: header,
                          ),
                          Spacer(),
                          Container(
                            width: 22,
                            child: IconButton(
                              padding: EdgeInsets.zero,
                              onPressed: () {},
                              icon: Image.asset(
                                'assets/ic_add.png',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30),
            ReorderableListView.builder(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                final task = tasks[index];
                return myTask(index, task);
              },
              onReorder: (oldIndex, newIndex) {
                setState(
                  () {
                    if (newIndex > oldIndex) newIndex--;
                    final task = tasks.removeAt(oldIndex);
                    tasks.insert(newIndex, task);
                  },
                );
              },
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget myTask(int index, Task task) => Padding(
        key: ValueKey(task),
        padding: const EdgeInsets.only(
          left: 24.0,
          right: 24,
          bottom: 16,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (task.cover != 'null')
                Image.asset(
                  task.cover,
                  height: 110,
                ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 16),
                    Container(
                      width: 46,
                      padding: EdgeInsets.symmetric(
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: task.status == 'LOW' ? softgreen : softred,
                        borderRadius: BorderRadius.circular(9),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            task.status,
                            style: task.status == 'LOW' ? labelGreen : labelRed,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      task.title,
                      style: h3,
                    ),
                    SizedBox(height: 6),
                    Text(
                      task.deadline,
                      style: small,
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Image.asset(
                          task.person,
                          height: 26,
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
