import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_list_app/common/app_style.dart';
import 'package:task_list_app/pages/tasks/_view/tasks_page.dart';

class AppNavigationBar extends StatelessWidget {
  final String? currentPath;
  const AppNavigationBar({Key? key, this.currentPath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppStyle.darkBlue,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 64),
        itemCount: navigationBarItems.length,
        itemBuilder: (context, index) => _NavigationBarListItem(
          item: navigationBarItems[index],
          currentPath: currentPath ?? '',
        ),
        separatorBuilder: (context, index) => Divider(
          color: AppStyle.mediumBlue,
          height: 1,
          endIndent: 16,
          indent: 16,
        ),
      ),
    );
  }
}

class _NavigationBarListItem extends StatelessWidget {
  final NavigationBarItem item;
  final String currentPath;
  const _NavigationBarListItem({
    Key? key,
    required this.item,
    required this.currentPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            item.url == 'tasks'
                ? context.goNamed('${item.url}', pathParameters: {
                    'taskNumber': (ref.read(currentTaskPage) + 1).toString()
                  })
                : context.goNamed('${item.url}');
          },
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: currentPath.contains(item.url) ? AppStyle.yellow : null),
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Text(
              item.name,
              style: TextStyle(
                color: currentPath.contains(item.url)
                    ? AppStyle.darkBlue
                    : AppStyle.lightTextColor,
                fontSize: 18,
              ),
            ),
          ),
        );
      },
    );
  }
}

final navigationBarItems = [
  // TODO: labels should be in app localization file
  NavigationBarItem(name: 'Tasks', url: 'tasks'),
  NavigationBarItem(name: 'Projects', url: 'projects'),
  NavigationBarItem(name: 'Teams', url: 'teams'),
];

class NavigationBarItem {
  final String name;
  final String url;

  NavigationBarItem({required this.name, required this.url});
}
