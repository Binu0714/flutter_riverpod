import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/comment.dart';

part 'comment_model.freezed.dart';
part 'comment_model.g.dart';

@freezed
class CommentModel extends Comment with _$CommentModel {
  const factory CommentModel({
    required int id,
    required int postId,
    required String name,
    required String body,
  }) = _CommentModel;

  factory CommentModel.fromJson(Map<String, dynamic> json) => _$CommentModelFromJson(json);
}