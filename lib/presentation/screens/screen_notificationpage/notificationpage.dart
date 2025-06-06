import 'package:e_naam/core/colors.dart';
import 'package:e_naam/presentation/blocs/fetch_notification/fetch_notification_bloc.dart';
import 'package:e_naam/widgets/custom_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  // Sample notification data
  // List<NotificationItem> notifications = [
  //   NotificationItem(
  //     title: "Welcome to our app!",
  //     content:
  //         "Thank you for downloading our app. Explore all the amazing features we have to offer.",
  //     timestamp: DateTime.now().subtract(const Duration(minutes: 30)),
  //     isRead: false,
  //   ),
  //   NotificationItem(
  //     title: "New Message",
  //     content: "You have received a new message from John Doe",
  //     timestamp: DateTime.now().subtract(const Duration(hours: 2)),
  //     isRead: false,
  //   ),
  //   NotificationItem(
  //     title: "Payment Successful",
  //     content: "Your payment of \$29.99 has been processed successfully",
  //     timestamp: DateTime.now().subtract(const Duration(hours: 5)),
  //     isRead: true,
  //   ),
  //   NotificationItem(
  //     title: "Update Available",
  //     content:
  //         "A new version of the app is available. Update now to get the latest features.",
  //     timestamp: DateTime.now().subtract(const Duration(days: 1)),
  //     isRead: true,
  //   ),
  //   NotificationItem(
  //     title: "Security Alert",
  //     content:
  //         "New login detected from Chrome on Windows. If this wasn't you, please secure your account.",
  //     timestamp: DateTime.now().subtract(const Duration(days: 2)),
  //     isRead: false,
  //   ),
  //   NotificationItem(
  //     title: "Weekly Report",
  //     content: "Your weekly activity report is ready. Check out your progress!",
  //     timestamp: DateTime.now().subtract(const Duration(days: 7)),
  //     isRead: true,
  //   ),
  // ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<FetchNotificationBloc>().add(FetchNotificationInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 216, 216, 216),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              CustomNavigation.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              size: 25,
              color: Appcolors.kwhiteColor,
            )),
        centerTitle: true,
        title: const Text(
          'Notifications',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Appcolors.kprimarycolor,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: BlocBuilder<FetchNotificationBloc, FetchNotificationState>(
        builder: (context, state) {
          if (state is FetchNotificationLoadingState) {
            return const Center(
              child: SpinKitCircle(
                size: 50,
                color: Appcolors.ksecondrycolor,
              ),
            );
          }
          if (state is FetchNotificationSuccessState) {
            return state.notifications.isEmpty
                ? _buildEmptyState()
                : ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: state.notifications.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: const Color.fromARGB(255, 228, 228, 228),
                            // border: notification.isRead
                            //     ? null
                            //     : Border.all(
                            //         color: const Color.fromARGB(255, 242, 215, 177), width: 1),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Notification Icon
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 239, 234, 234),
                                  borderRadius: BorderRadius.circular(24),
                                ),
                                child: const Icon(
                                  Icons.notifications_none,
                                  color: Appcolors.korangeColor,
                                  size: 20,
                                ),
                              ),
                              const SizedBox(width: 12),
                              // Notification Content
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            'Notifications',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.grey[700],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      state.notifications[index].notification,
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey[600],
                                        height: 1.3,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      _getRelativeTime(DateTime.parse(state
                                          .notifications[index]
                                          .createdAt
                                          .date)),
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey[500],
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
          } else if (state is FetchNotificationsErrorState) {
            return Center(
              child: Text(state.message),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.notifications_none,
            size: 80,
            color: Appcolors.ksecondrycolor,
          ),
          const SizedBox(height: 16),
          Text(
            'No notifications yet',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'When you get notifications, they\'ll show up here',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[500],
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  // void _showOptionsMenu(BuildContext context) {
  //   showModalBottomSheet(
  //     context: context,
  //     shape: const RoundedRectangleBorder(
  //       borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
  //     ),
  //     builder: (context) => Container(
  //       padding: const EdgeInsets.all(20),
  //       child: Column(
  //         mainAxisSize: MainAxisSize.min,
  //         children: [
  //           ListTile(
  //             leading:
  //                 const Icon(Icons.mark_email_read, color: Colors.deepPurple),
  //             title: const Text('Mark all as read'),
  //             onTap: () {
  //               _markAllAsRead();
  //               Navigator.pop(context);
  //             },
  //           ),
  //           ListTile(
  //             leading: const Icon(Icons.delete_outline, color: Colors.red),
  //             title: const Text('Clear all notifications'),
  //             onTap: () {
  //               _clearAllNotifications();
  //               Navigator.pop(context);
  //             },
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  // void _markAsRead(int index) {
  //   setState(() {
  //     notifications[index].isRead = true;
  //   });
  // }

  // void _markAllAsRead() {
  //   setState(() {
  //     for (var notification in notifications) {
  //       notification.isRead = true;
  //     }
  //   });
  // }

  // void _clearAllNotifications() {
  //   setState(() {
  //     notifications.clear();
  //   });
  // }

  String _getRelativeTime(DateTime timestamp) {
    final now = DateTime.now();
    final difference = now.difference(timestamp);

    if (difference.inMinutes < 1) {
      return 'Just now';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes} minute${difference.inMinutes == 1 ? '' : 's'} ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} hour${difference.inHours == 1 ? '' : 's'} ago';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} day${difference.inDays == 1 ? '' : 's'} ago';
    } else if (difference.inDays < 30) {
      final weeks = (difference.inDays / 7).floor();
      return '${weeks} week${weeks == 1 ? '' : 's'} ago';
    } else if (difference.inDays < 365) {
      final months = (difference.inDays / 30).floor();
      return '${months} month${months == 1 ? '' : 's'} ago';
    } else {
      final years = (difference.inDays / 365).floor();
      return '${years} year${years == 1 ? '' : 's'} ago';
    }
  }
}

class NotificationItem {
  final String title;
  final String content;
  final DateTime timestamp;

  bool isRead;

  NotificationItem({
    required this.title,
    required this.content,
    required this.timestamp,
    this.isRead = false,
  });
}
