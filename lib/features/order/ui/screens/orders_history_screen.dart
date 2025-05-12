import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_progress_indicator.dart';
import '../../data/models/order_history/order_history_model.dart';
import '../../logic/order_history/order_history_cubit.dart';
import '../../logic/order_history/order_history_state.dart';
import '../widgets/order_history_screen_item.dart';

class OrdersHistoryScreen extends StatefulWidget {
  const OrdersHistoryScreen({super.key});

  @override
  State<OrdersHistoryScreen> createState() => _OrdersHistoryScreenState();
}

class _OrdersHistoryScreenState extends State<OrdersHistoryScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    context.read<OrderHistoryCubit>().emitGetOrderHistory();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final cubit = context.read<OrderHistoryCubit>();
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - 200 &&
        !cubit.isLoadingMore &&
        !cubit.hasReachedMax) {
      debugPrint('Triggering load more: current page ${cubit.currentPage}');
      cubit.emitGetOrderHistory(isInitialLoad: false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBackgroundColor,
      appBar: const CustomAppBar(title: 'Orders History'),
      body: BlocBuilder<
        OrderHistoryCubit,
        OrderHistoryState<OrderHistoryResponse>
      >(
        builder: (context, state) {
          return state.when(
            idle: () => const Center(child: CustomProgressIndicator()),
            loading: () => const Center(child: CustomProgressIndicator()),
            success: (response) {
              final orders = response.orders;
              final cubit = context.read<OrderHistoryCubit>();

              return ListView.builder(
                controller: _scrollController,
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(vertical: 30.r),
                itemCount: orders.length + (cubit.hasReachedMax ? 0 : 1),
                itemBuilder: (_, index) {
                  if (index < orders.length) {
                    final order = orders[index];
                    return OrderHistoryScreenItem(
                      title: 'Order #${order.orderId?.substring(0, 8)}',
                      subTitle:
                          '${order.status?.toUpperCase()} - ${order.orderCreatedAt?.substring(0, 10)}',
                      press: () {
                        context.pushNamed(
                          Routes.ordersHistoryDetailsScreen,
                          arguments: {'productId': order.orderId},
                        );
                      },
                    );
                  } else {
                    return const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Center(child: CustomProgressIndicator()),
                    );
                  }
                },
              );
            },
            error: (errorMsg) {
              return Center(
                child: Text(
                  errorMsg.toString(),
                  style: TextStyle(
                    color: AppColors.kTextColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
