import 'package:flutter/material.dart';
import '../Themes/constants.dart';

class TaskContainer extends StatelessWidget {
  final int totalTasks;
  final int completedTasks;

  const TaskContainer({
    super.key,
    required this.totalTasks,
    required this.completedTasks,
  });

  @override
  Widget build(BuildContext context) {
    final double completionPercentage = totalTasks > 0 ? completedTasks / totalTasks : 0;
    return SafeArea(
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(
          context,
          'task_list_page',
          arguments: {
            'totalTasks': totalTasks,
            'completedTasks': completedTasks,
          },
        ),
        child: Container(
          height: 80.0,
          width: 360.0,
          decoration: BoxDecoration(
            color: k1PrimaryColor,
            borderRadius: const BorderRadius.all(Radius.circular(20.0)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 3.0,
                blurRadius: 5.0,
                offset: const Offset(3, 3),
              ),
              BoxShadow(
                color: Colors.white,
                spreadRadius: 3.0,
                blurRadius: 5.0,
                offset: const Offset(-3, -3),
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
                    color: k1PrimaryColor,
                    boxShadow: kShadow,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: k1PrimaryColor,
                        boxShadow: kShadow,
                      ),
                      child: Center(
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                                decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                  color: k1PrimaryColor,
                                  boxShadow: kShadow,
                                ),
                              child: Padding(
                                padding: const EdgeInsets.all(0.5),
                                child: CircularProgressIndicator(
                                  backgroundColor: Colors.black.withOpacity(0.1),
                                  strokeWidth: 10.0,
                                  value: completionPercentage,
                                  valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: Center(
                                child: Text(
                                  "${(completionPercentage * 100).toStringAsFixed(1)}%",
                                  style: const TextStyle(
                                    color: Colors.blue,
                                    fontSize: 8.0,
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
