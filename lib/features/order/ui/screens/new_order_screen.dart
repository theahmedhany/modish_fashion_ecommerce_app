import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_fonts.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_progress_indicator.dart';
import '../../data/models/delivery_method/delivery_method_model.dart';
import '../../logic/delivery_method/delivery_method_cubit.dart';
import '../../logic/delivery_method/delivery_method_state.dart';
import '../../logic/new_order/new_order_cubit.dart';
import '../widgets/new_order_bloc_listener.dart';

class NewOrderScreen extends StatelessWidget {
  const NewOrderScreen({
    super.key,
    required this.productName,
    required this.productImage,
    required this.productPrice,
    required this.productId,
  });

  final String productName, productImage, productId;
  final double productPrice;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBackgroundColor,
      appBar: const CustomAppBar(title: 'New Order'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.r),
        child: SingleChildScrollView(
          child: Form(
            key: context.read<NewOrderCubit>().formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpace(30),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.kSecondaryColor.withValues(alpha: 0.3),
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          width: 0.5,
                          color: AppColors.kSecondaryGrey,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: CachedNetworkImage(
                          imageUrl: productImage,
                          width: 100.r,
                          height: 100.r,
                          fit: BoxFit.cover,
                          placeholder: (context, url) {
                            return Center(child: CustomProgressIndicator());
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
                    horizontalSpace(20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            productName,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AppFonts.font18DarkMedium,
                          ),
                          verticalSpace(10),
                          Text(
                            '\$${productPrice.toString()}',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AppFonts.font16GreyRegular,
                          ),
                          verticalSpace(10),
                        ],
                      ),
                    ),
                  ],
                ),
                verticalSpace(30),
                Text('First Name', style: AppFonts.font16DarkMedium),
                verticalSpace(8),
                AppTextField(
                  hintText: 'Enter Your First Name.',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your first name.';
                    }
                  },
                  controller: context.read<NewOrderCubit>().firstNameController,
                ),
                verticalSpace(16),
                Text('Last Name', style: AppFonts.font16DarkMedium),
                verticalSpace(8),
                AppTextField(
                  hintText: 'Enter Your Last Name.',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your last name.';
                    }
                  },
                  controller: context.read<NewOrderCubit>().lastNameController,
                ),
                verticalSpace(16),
                Text('Street', style: AppFonts.font16DarkMedium),
                verticalSpace(8),
                AppTextField(
                  hintText: 'Enter Your Street Name.',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your street name.';
                    }
                  },
                  controller:
                      context.read<NewOrderCubit>().streetNameController,
                ),
                verticalSpace(16),
                Text('City', style: AppFonts.font16DarkMedium),
                verticalSpace(8),
                AppTextField(
                  hintText: 'Enter Your City Name.',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your city name.';
                    }
                  },
                  controller: context.read<NewOrderCubit>().cityNameController,
                ),
                verticalSpace(16),
                Text('Country', style: AppFonts.font16DarkMedium),
                verticalSpace(8),
                AppTextField(
                  hintText: 'Enter Your Country Name.',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your country name.';
                    }
                  },
                  controller:
                      context.read<NewOrderCubit>().countryNameController,
                ),
                verticalSpace(16),
                Text('Delivery Method', style: AppFonts.font16DarkMedium),
                verticalSpace(8),
                BlocBuilder<
                  DeliveryMethodCubit,
                  DeliveryMethodState<List<DeliveryMethodModel>>
                >(
                  builder: (context, state) {
                    return state.when(
                      idle:
                          () => AppTextField(
                            hintText: 'Select delivery method.',
                            enabled: false,
                            validator: (value) {},
                          ),
                      loading:
                          () => AppTextField(
                            hintText: 'Select delivery method.',
                            enabled: false,
                            validator: (value) {},
                          ),
                      error:
                          (error) => AppTextField(
                            hintText:
                                'There was an error in loading delivery method.',
                            enabled: false,
                            validator: (value) {},
                          ),
                      success: (deliveryMethods) {
                        return DropdownButtonFormField<String>(
                          isExpanded: true,
                          value:
                              context
                                      .read<NewOrderCubit>()
                                      .deliveryMethodIdController
                                      .text
                                      .isEmpty
                                  ? null
                                  : context
                                      .read<NewOrderCubit>()
                                      .deliveryMethodIdController
                                      .text,
                          items:
                              deliveryMethods.map((method) {
                                return DropdownMenuItem(
                                  value: method.id,
                                  child: ListTile(
                                    title: Text(
                                      '${method.description}.',
                                      style: AppFonts.font14DarkMedium,
                                    ),
                                    subtitle: Text(
                                      '${method.deliveryTime ?? ''} (${method.cost != null ? '\$${method.cost}' : ''})',
                                      style: AppFonts.font12GreyRegular,
                                    ),
                                    trailing: Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      size: 18,
                                      color: AppColors.kSecondaryColor,
                                    ),
                                  ),
                                );
                              }).toList(),
                          selectedItemBuilder: (BuildContext context) {
                            return deliveryMethods.map((method) {
                              return Text(
                                '${method.description}.',
                                style: AppFonts.font16DarkMedium,
                              );
                            }).toList();
                          },
                          onChanged: (value) {
                            if (value != null) {
                              context
                                  .read<NewOrderCubit>()
                                  .deliveryMethodIdController
                                  .text = value;
                            }
                          },
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 24.h,
                              vertical: 16.w,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: BorderSide(width: 1),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: BorderSide(
                                width: 1,
                                color: AppColors.kPrimaryColor.withValues(
                                  alpha: 0.3,
                                ),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: BorderSide(
                                width: 1,
                                color: AppColors.kPrimaryColor.withValues(
                                  alpha: 0.3,
                                ),
                              ),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.red,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.red,
                                width: 1.3,
                              ),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            hintStyle: TextStyle(
                              color: AppColors.kTextColor,
                              fontSize: 14.h,
                            ),

                            hintText: 'Select delivery method.',
                            fillColor: Colors.white,
                            filled: true,
                          ),
                          dropdownColor: Colors.white,
                          borderRadius: BorderRadius.circular(18),
                          icon: Icon(
                            Icons.arrow_drop_down_circle_outlined,
                            color: AppColors.kPrimaryColor.withValues(
                              alpha: 0.3,
                            ),
                          ),
                          iconSize: 24,
                          elevation: 2,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please select a delivery method.';
                            }
                            return null;
                          },
                        );
                      },
                    );
                  },
                ),
                verticalSpace(40),
                AppButton(
                  press: () {
                    validateThenCreateNewOrder(context);
                  },
                  buttonTitle: 'Create Order',
                ),
                verticalSpace(30),
                NewOrderBlocListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateThenCreateNewOrder(BuildContext context) {
    if (context.read<NewOrderCubit>().formKey.currentState!.validate()) {
      context.read<NewOrderCubit>().emitNewOrder(productId);
    }
  }
}
