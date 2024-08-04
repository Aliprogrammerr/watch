// ignore_for_file: must_be_immutable



import 'package:flex/compunents/TextStyles.dart';
import 'package:flex/compunents/expamntion.dart';
import 'package:flex/constant/AppColors.dart';
import 'package:flex/constant/Strings.dart';
import 'package:flex/constant/dimens.dart';
import 'package:flex/data/Repo/ProductDitailRepo.dart';
import 'package:flex/data/model/product_dirtail.dart';
import 'package:flex/screnns/product_Ditail/bloc%20/productditail_bloc.dart';
import 'package:flex/widget/AppBtn.dart';
import 'package:flex/widget/customAppbar.dart';
import 'package:flex/widget/homeTiteProduct.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDitailScreen extends StatefulWidget {
  ProductDitailScreen(
      {required this.id,
      super.key,
      this.title = "the titile of the product",
      this.icon = const SizedBox()});
  String title;
  Widget icon;
  final id;

  @override
  State<ProductDitailScreen> createState() => _ProductDitailState();
}

class DitailNavigation {
  DitailNavigation._();
  static const comments = 0;
  static const review = 1;
  static const features = 2;
}

class _ProductDitailState extends State<ProductDitailScreen> {
  int? selectedIndex = DitailNavigation.features;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocProvider(
      create :(context) {
        final productbloc = ProductditailBloc(productRepository);
        productbloc.add(ProductditailInit(id: widget.id));
        return productbloc;},
      child: BlocConsumer<ProductditailBloc,ProductditailState>(
        listener: (context, state) {
        },
        builder: (context, state) {
          if (state is ProductditailError){
            return Text("errror");
          }
          else if(state is ProductditailLoading){
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(
                  color: MyColors.primaryColor,
                ),
              ),
            );
          }
          else if (state is ProductditailLoaded){
            return  Scaffold(
              appBar: CustomAppbar(
                title:state.productDetail.title!,
              ),
              body: Container(
                color: MyColors.bakgroundColor,
                child: Stack(
                  children: [
                    SingleChildScrollView(
                      child: Container(
                        color: MyColors.homePagebg,
                        margin:  EdgeInsets.symmetric(horizontal: 14),
                        child: Column(children: [
                          const SizedBox(height: 20,),
                          ClipRRect(
                            borderRadius:
                                 BorderRadius.all(Radius.circular(10)),
                            child: Image.network(
                              state.productDetail.image!,
                              fit: BoxFit.cover,
                              scale: 1.5,
                            ),
                          ),const SizedBox(height: 30,),
                            Padding(
                            padding: EdgeInsets.only(right: 20),
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                state.productDetail.brand!,
                                style: AppTextStyle.splashText,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10,),
                          Padding(
                            padding: EdgeInsets.only(right: 20),
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                state.productDetail.title!,
                                style: AppTextStyle.title,
                              ),
                            ),
                          ),
                        
                          const SizedBox(
                            height: 30,
                          ),
                          Container(
                            decoration: const BoxDecoration(
                                color: MyColors.bakgroundColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                            width: size.width * .9,
                            child: Row(
                              children: [
                                TitleProductbtn(
                                  text: AppStrings.comments,
                                  isActive:
                                      selectedIndex == DitailNavigation.comments,
                                  ontap: () => ditailProductTitle(
                                      index: DitailNavigation.comments),
                                  width: size.width * .3,
                                ),
                                TitleProductbtn(
                                  text: AppStrings.features,
                                  isActive:
                                      selectedIndex == DitailNavigation.features,
                                  ontap: () => ditailProductTitle(
                                      index: DitailNavigation.features),
                                  width: size.width * .3,
                                ),
                                TitleProductbtn(
                                  text: AppStrings.review,
                                  isActive:
                                      selectedIndex == DitailNavigation.review,
                                  ontap: () => ditailProductTitle(
                                      index: DitailNavigation.review),
                                  width: size.width * .3,
                                ),
                              ],
                            ),
                          ),
                          IndexedStack(
                            index: selectedIndex,
                            children: [
                              Review(text:state.productDetail.description!,),
                              CommentsList(comments: state.productDetail.comments!),
                              PropertiesList(properties:state.productDetail.properties!,)
                      
                            ],
                          ),
                        ]),
                      ),
                    ),
                    Positioned(
                      bottom: 5,
                      right: 20,
                      left: 20,
                      child: Container(
                        color: MyColors.productBg,

                        padding: const EdgeInsets.symmetric(
                            horizontal: AppDimens.medium),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppButton(
                                width: size.width * .4,
                                ontap: () {},
                                text: AppStrings.addToCart),
                             Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  state.productDetail.price!.seperateWithComma,
                                  style: AppTextStyle.productPrice,
                                ),
                                Visibility(
                                    visible: state.productDetail.discount! > 0 ? true : false  ,
                                    child: Text(
                                      state.productDetail.discountPrice!.seperateWithComma,
                                        style:
                                            AppTextStyle.productPriceDiscount))
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ));
          
          }else {
            throw Exception("shit");
          }
         
        },
      ),
    );
  }

  ditailProductTitle({required index}) {
    setState(() {
      selectedIndex = index;
    });
  }
}
class PropertiesList extends StatelessWidget {
  final List<Properties> properties;
  const PropertiesList({super.key, required this.properties});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const ClampingScrollPhysics(),
      itemCount: properties.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Container(
          width: double.infinity,
          padding: const EdgeInsets.all(AppDimens.medium),
          margin: const EdgeInsets.all(AppDimens.small),
          decoration: BoxDecoration(
          color: MyColors.borderColor,
            borderRadius: BorderRadius.all(Radius.circular(8))
          ),
              child: Text(
            "${properties[index].property} : ${properties[index].value}",
            style: AppTextStyle.title,
            textAlign: TextAlign.right,
          ),
        );
      },
    );
  }
}

class CommentsList extends StatelessWidget {
  final List<Comments> comments;

  const CommentsList({super.key, required this.comments});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const ClampingScrollPhysics(),
      itemCount: comments.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Container(
          width: double.infinity,
         padding: const EdgeInsets.all(AppDimens.medium),
          margin: const EdgeInsets.all(AppDimens.small),
          decoration: BoxDecoration(
          color: MyColors.borderColor,
            borderRadius: BorderRadius.all(Radius.circular(8))
          ),
          child: Text(
            "${comments[index].user} : ${comments[index].body}",
            style: AppTextStyle.title,
            textAlign: TextAlign.right,
          ),
        );
      },
    );
  }
}

class Review extends StatelessWidget {
  final text;
  const Review({super.key, this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text);
  }
}