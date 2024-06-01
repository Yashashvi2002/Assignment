
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

class TaskContainer extends StatelessWidget {
  final int totalTasks;
  final int completedTasks;

  const TaskContainer({
    Key? key,
    required this.totalTasks,
    required this.completedTasks,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double completionPercentage = totalTasks > 0 ? completedTasks / totalTasks : 0;
    return SafeArea(
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(context, 'task_list_page'),
        child: Container(
          height: 80.0,
          width: 360.0,
          decoration: BoxDecoration(
            color: kPrimaryColor, // Assuming kPrimaryColor is blue
            borderRadius: const BorderRadius.all(Radius.circular(20.0)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 3.0,
                blurRadius: 5.0,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: kPrimaryColor,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 10.0,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: kPrimaryColor,
                      ),
                      child: Center(
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            CircularProgressIndicator(
                              backgroundColor: Colors.black.withOpacity(0.07),
                              strokeWidth: 5.0,
                              value: completionPercentage,
                              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                            ),
                            SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: Center(
                                child: Text(
                                  "${(completionPercentage * 100).toStringAsFixed(1)}%",
                                  style: const TextStyle(
                                    color: Colors.blue,
                                    fontSize: 10.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 20.0),
                Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "This is the task list. Opens a dialogue box showing tasks, read more...",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}