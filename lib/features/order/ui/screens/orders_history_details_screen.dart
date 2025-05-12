import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/constants.dart';
import '../../../../core/helpers/extensions.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_fonts.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_progress_indicator.dart';
import '../../data/models/order_history_details/order_history_details_model.dart';
import '../../logic/order_history_details/order_history_details_cubit.dart';
import '../../logic/order_history_details/order_history_details_state.dart';

class OrdersHistoryDetailsScreen extends StatelessWidget {
  const OrdersHistoryDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBackgroundColor,
      appBar: const CustomAppBar(title: 'Order Details'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.r, vertical: 10.r),
        child: SingleChildScrollView(
          child: BlocBuilder<
            OrderHistoryDetailsCubit,
            OrderHistoryDetailsState<OrderHistoryDetailsModel>
          >(
            builder: (context, state) {
              return state.when(
                idle: () => const Center(child: CustomProgressIndicator()),
                loading: () => const Center(child: CustomProgressIndicator()),
                success: (orderData) {
                  return Column(
                    children: [
                      verticalSpace(16),
                      Container(
                        width: double.infinity,
                        height: 200.h,
                        padding: EdgeInsets.all(20.r),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.r),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.kMainGrey.withValues(alpha: 0.5),
                              blurRadius: 10.r,
                              offset: const Offset(0, 4),
                            ),
                          ],
                          border: Border.all(
                            color: AppColors.kMainGrey.withValues(alpha: 0.3),
                            width: 1.r,
                          ),
                        ),
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: AppColors.kSecondaryColor.withValues(
                                  alpha: 0.3,
                                ),
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                  width: 0.5,
                                  color: AppColors.kSecondaryGrey,
                                ),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: CachedNetworkImage(
                                  imageUrl:
                                      '${orderData.items?[0].product?.productUrl}',
                                  width: 100.r,
                                  height: double.infinity,
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) {
                                    return Center(
                                      child: CustomProgressIndicator(),
                                    );
                                  },
                                  errorWidget: (context, url, error) {
                                    return Center(
                                      child: Image.asset(
                                        'assets/master/splash_screen.png',
                                        width: 100.w,
                                        fit: BoxFit.contain,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),

                            horizontalSpace(18),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '${orderData.items?[0].product?.productName}.',
                                  maxLines: 1,
                                  style: AppFonts.font16DarkBold.copyWith(
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                verticalSpace(10),
                                Text(
                                  'Created At: ${orderData.items?[0].createdAt?.substring(0, 10) ?? 'Unknown Date'}',
                                  maxLines: 1,
                                  style: AppFonts.font14GreyRegular.copyWith(
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                verticalSpace(10),
                                Text(
                                  'Quantity: ${orderData.items?[0].quantity}x',
                                  maxLines: 1,
                                  style: AppFonts.font14GreyRegular.copyWith(
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                verticalSpace(10),
                                Text(
                                  'Product Price: \$${orderData.items?[0].price}',
                                  maxLines: 1,
                                  style: AppFonts.font14GreyRegular.copyWith(
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      verticalSpace(26),

                      AppButton(
                        press: () {
                          productDetailsId =
                              orderData.items?[0].product?.productId ?? '';
                          context.pushNamed(Routes.detailsScreen);
                        },
                        buttonTitle: 'View Product',
                      ),

                      verticalSpace(18),
                      Divider(
                        color: AppColors.kMainGrey.withValues(alpha: 0.5),
                      ),
                      verticalSpace(18),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Delivery Status.',
                              style: AppFonts.font16DarkBold,
                            ),
                          ),
                          verticalSpace(10),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '${orderData.status?.toUpperCase()}.',
                              maxLines: 1,
                              style: AppFonts.font14GreyRegular.copyWith(
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          verticalSpace(10),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Order ID: #${orderData.items?[0].id ?? 'Unknown Order ID'}',
                              maxLines: 1,
                              style: AppFonts.font14GreyRegular.copyWith(
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          verticalSpace(10),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Order Date: ${orderData.orderDate?.substring(0, 10) ?? 'Unknown Date'}',
                              maxLines: 1,
                              style: AppFonts.font14GreyRegular.copyWith(
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ],
                      ),

                      verticalSpace(18),
                      Divider(
                        color: AppColors.kMainGrey.withValues(alpha: 0.5),
                      ),
                      verticalSpace(18),

                      Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Payment Information.',
                              style: AppFonts.font16DarkBold,
                            ),
                          ),
                          verticalSpace(10),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Payment Method: ${orderData.paymentMethod ?? 'Unknown Method'}.',
                              maxLines: 1,
                              style: AppFonts.font14GreyRegular.copyWith(
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          verticalSpace(10),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Total Amount: \$${orderData.total}',
                              maxLines: 1,
                              style: AppFonts.font14GreyRegular.copyWith(
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          verticalSpace(10),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Sub Total:  \$${orderData.subTotal}',
                              maxLines: 1,
                              style: AppFonts.font14GreyRegular.copyWith(
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ],
                      ),

                      verticalSpace(18),
                      Divider(
                        color: AppColors.kMainGrey.withValues(alpha: 0.5),
                      ),
                      verticalSpace(18),

                      Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Shipping Address.',
                              style: AppFonts.font16DarkBold,
                            ),
                          ),
                          verticalSpace(10),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '${orderData.shippingAddress?.firstName}, ${orderData.shippingAddress?.lastName}.',
                              maxLines: 1,
                              style: AppFonts.font14GreyRegular.copyWith(
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          verticalSpace(10),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '${orderData.shippingAddress?.street}, ${orderData.shippingAddress?.city}, ${orderData.shippingAddress?.Country}.',
                              maxLines: 1,
                              style: AppFonts.font14GreyRegular.copyWith(
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ],
                      ),

                      verticalSpace(18),
                      Divider(
                        color: AppColors.kMainGrey.withValues(alpha: 0.5),
                      ),
                      verticalSpace(24),
                    ],
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
        ),
      ),
    );
  }
}
