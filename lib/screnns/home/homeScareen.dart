import 'package:flex/compunents/TextStyles.dart';
import 'package:flex/constant/AppColors.dart';
import 'package:flex/constant/Strings.dart';
import 'package:flex/constant/dimens.dart';
import 'package:flex/data/repo/home.repo.dart';
import 'package:flex/screnns/Register/cubit/register_cubit.dart';
import 'package:flex/screnns/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) {
      final homeBloc = HomeBloc(homeRepository);
      homeBloc.add(HomeInit());
        return homeBloc; 
      },
      child: SingleChildScrollView(
        child: BlocBuilder<HomeBloc,HomeState>(
          builder: (context, state) {
            if (state is LoadingState) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is HomeLoaded) {
              return Column(
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: AppDimens.large),
                      height: size.height * .07,
                      decoration: BoxDecoration(
                          color: MyColors.apptextFeildColor,
                          borderRadius:
                              BorderRadius.circular(AppDimens.medium)),
                      child: const Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Icon(Icons.search),
                          SizedBox(
                            width: 40,
                          ),
                          Text(
                            AppStrings.textFeildTEext,
                            style: AppTextStyle.title,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            } else 
              return Text("error bro rrror");
            } 

        ),
      ),
    );
  }
}
