import 'package:flutter/cupertino.dart';
import 'package:location_specialist/helpers/components/interfaces/service_review_interface.dart';
import 'package:location_specialist/helpers/widgets/snackbars/snackbar_handler.dart';
import 'package:location_specialist/providers/auth_provider.dart';

class CommentProvider with ChangeNotifier {
  ServiceReviewInterface repo;
  late AuthProvider auth;
  CommentProvider(this.repo);
  sendComment(String text) async {
    await repo.sendComment(text);
    SnackbarHandler.success(
        title: 'Успех', body: "Вы успешно добавили коментарий");
  }
}
