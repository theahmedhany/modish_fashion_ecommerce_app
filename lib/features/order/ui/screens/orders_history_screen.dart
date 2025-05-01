import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helpers/constants.dart';
import '../../../../core/helpers/extensions.dart';
import '../../../../core/helpers/shared_pref_helper.dart';
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
  String? _appUserId;

  @override
  void initState() {
    super.initState();
    _loadAppUserId();
  }

  Future<void> _loadAppUserId() async {
    final id = await SharedPrefHelper.getString(SharedPrefKeys.appUserId);
    setState(() {
      _appUserId = id;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBackgroundColor,
      appBar: const CustomAppBar(title: 'Orders History'),
      body:
          _appUserId == null
              ? const Center(child: CustomProgressIndicator())
              : BlocBuilder<
                OrderHistoryCubit,
                OrderHistoryState<List<OrderHistoryModel>>
              >(
                builder: (context, state) {
                  return state.when(
                    idle: () => const Center(child: CustomProgressIndicator()),
                    loading:
                        () => const Center(child: CustomProgressIndicator()),
                    success: (orders) {
                      // Reverse the list here
                      final reversedOrders = orders.reversed.toList();
                      return ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        padding: EdgeInsets.symmetric(vertical: 30.r),
                        itemCount: reversedOrders.length,
                        itemBuilder: (_, index) {
                          final order = reversedOrders[index];
                          return OrderHistoryScreenItem(
                            title: 'Order #${order.orderId}',
                            subTitle: '${order.status}.',
                            press: () {
                              context.pushNamed(
                                Routes.ordersHistoryDetailsScreen,
                                arguments: {
                                  'productId': order.orderId,
                                  'appUserId': _appUserId,
                                },
                              );
                            },
                          );
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
