part of 'dashboard_cubit.dart';

abstract class DashboardState extends Equatable {
  const DashboardState();

  @override
  List<Object> get props => [];
}

class DashboardInitial extends DashboardState {}

class DashboardLoading extends DashboardState {}

class DashboardSuccess extends DashboardState {
  final String helloMessage;

  const DashboardSuccess({required this.helloMessage});

  @override
  List<Object> get props => [helloMessage];
}

class DashboardError extends DashboardState {
  final String msg;

  const DashboardError({required this.msg});

  @override
  List<Object> get props => [msg];
}
