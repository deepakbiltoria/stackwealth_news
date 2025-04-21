import 'package:flutter/material.dart';
import 'package:stackwealth_news/core/utils/color_constant.dart';
import 'package:stackwealth_news/core/utils/date_utils.dart';
import 'package:stackwealth_news/core/widgets/custom_divider.dart';
import 'package:stackwealth_news/features/home/domain/entities/article.dart';
import 'package:stackwealth_news/theme/app_style.dart';

class NewsDetailScreen extends StatelessWidget {
  final Article article;
  const NewsDetailScreen({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.whiteA700,
      appBar: AppBar(
        backgroundColor: ColorConstant.whiteA700,
        iconTheme: IconThemeData(color: ColorConstant.black900),
        elevation: 0,
        actions: [
          Icon(Icons.more_vert, color: ColorConstant.gray600),
          const SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Publisher Info Row
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(article.urlToImage ?? ''),
                  radius: 20,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(article.source,
                          style: AppStyle.txtPoppinsMedium14.copyWith(
                            color: ColorConstant.black900,
                          )),
                      Text(
                        article.publishedAt != null &&
                                article.publishedAt.toString().isNotEmpty
                            ? DateTimeTools.formatDate(article.publishedAt!)
                            : '',
                        style: AppStyle.txtPoppinsRegular12.copyWith(
                          color: ColorConstant.gray600,
                        ),
                      ),
                    ],
                  ),
                ),
                // Interaction Bar
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(Icons.bookmark_border,
                        color: ColorConstant.indigoA200, size: 30),
                  ],
                ),
                // Container(
                //   padding:
                //       const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                //   decoration: AppDecoration.fillBlue,
                //   child: Text(
                //     "Following",
                //     style: AppStyle.txtPoppinsMedium12.copyWith(
                //       color: ColorConstant.whiteA700,
                //     ),
                //   ),
                // ),
              ],
            ),
            const SizedBox(height: 16),

            // News Image
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: article.urlToImage != null
                  ? Image.network(
                      article.urlToImage!,
                      width: double.infinity,
                      height: 200,
                      fit: BoxFit.cover,
                    )
                  : Container(
                      height: 200,
                      width: double.infinity,
                      color: ColorConstant.gray300,
                      child: Icon(Icons.image, color: ColorConstant.gray600),
                    ),
            ),
            const SizedBox(height: 16),

            // Category (hardcoded here)
            Text(
                "Author : ${article.author ?? ''}", // Replace with actual category if available
                style: AppStyle.txtPoppinsRegular12
                    .copyWith(color: ColorConstant.gray600)),

            const SizedBox(height: 8),

            // Title
            Text(
              article.title,
              style: AppStyle.txtPoppinsSemiBold24.copyWith(
                color: ColorConstant.black900,
              ),
            ),
            const SizedBox(height: 12),

            // Description
            if (article.description != null)
              Text(
                article.description!,
                style: AppStyle.txtPoppinsRegular14.copyWith(
                  color: ColorConstant.gray800,
                ),
              ),

            const SizedBox(height: 12),

            // Content (optional)
            if (article.content != null)
              Text(
                article.content!,
                style: AppStyle.txtPoppinsRegular14.copyWith(
                  color: ColorConstant.gray800,
                ),
              ),
            CustomDivider(),
          ],
        ),
      ),
    );
  }
}
