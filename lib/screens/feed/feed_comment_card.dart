import 'package:developer_look/models/feed_model.dart';
import 'package:developer_look/styles/app_colors.dart';
import 'package:developer_look/widgets/common/img.dart';
import 'package:flutter/material.dart';

class FeedCommentCard extends StatelessWidget {
  final Comments? comment;
  const FeedCommentCard({super.key, required this.comment});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: AppColors.grey,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Img(
                src: comment?.user.image ?? 'assets/user.png',
                height: 40,
                width: 40,
                borderRadius: BorderRadius.circular(20),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          comment?.user.name ?? '',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "${comment?.votes} Upvotes",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    Text(
                      comment?.time ?? '',
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            comment?.comment ?? '',
            style: TextStyle(fontSize: 14, color: Colors.black87),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.thumb_up_alt_outlined, size: 20),
              ),
              const Text("Upvote"),
              const SizedBox(width: 16),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.reply_outlined, size: 20),
              ),
              const Text("Reply"),
            ],
          ),
        ],
      ),
    );
  }
}
