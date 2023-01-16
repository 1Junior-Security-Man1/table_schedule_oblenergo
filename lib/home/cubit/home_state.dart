import 'package:equatable/equatable.dart';
import 'package:table_schedule_oblenergo/home/data/table_colors.dart';

enum MainStatus { initial, loading, complete, error }

enum TextStatus { initial, loading, complete, error }

enum ListViewStatus { initial, loading, complete, error }

class HomeState extends Equatable {
  const HomeState({
    this.status = MainStatus.initial,
    this.textStatus = TextStatus.initial,
    this.listViewStatus = ListViewStatus.initial,
    this.imageUrl = '',
    this.willBeLight = '0',
    this.willBeNoLight = '0',
    this.listColors = const <TableColors> [],
  });

  final MainStatus status;
  final TextStatus textStatus;
  final ListViewStatus listViewStatus;
  final String imageUrl;
  final String willBeLight;
  final String willBeNoLight;
  final List<TableColors> listColors;

  HomeState copyWith({
    MainStatus? status,
    TextStatus? textStatus,
    ListViewStatus? listViewStatus,
    String? imageUrl,
    String? willBeLight,
    String? willBeNoLight,
    List<TableColors>? listColors,
  }) {
    return HomeState(
      status: status ?? this.status,
      textStatus: textStatus ?? this.textStatus,
      listViewStatus: listViewStatus ?? this.listViewStatus,
      imageUrl: imageUrl ?? this.imageUrl,
      willBeLight: willBeLight ?? this.willBeLight,
      willBeNoLight: willBeNoLight ?? this.willBeNoLight,
      listColors: listColors ?? this.listColors,
    );
  }

  @override
  List<Object> get props => [
    status,
    //textStatus,
    listViewStatus,
    imageUrl,
    willBeLight,
    willBeNoLight,
    listColors];
}