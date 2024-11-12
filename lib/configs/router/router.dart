import 'package:courses_platform/configs/router/routes.dart';
import 'package:courses_platform/core/constants/login_constants.dart';
import 'package:courses_platform/core/service_locator/locator.dart';
import 'package:courses_platform/features/Auth/manager/cubit/auth_cubit.dart';
import 'package:courses_platform/features/Auth/manager/cubit/register_cubit.dart';
import 'package:courses_platform/features/Auth/presentation/pages/home_page.dart';
import 'package:courses_platform/features/Auth/presentation/pages/login_page.dart';
import 'package:courses_platform/features/Auth/presentation/pages/register_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: AppRoutes.kInitialRoute,
        builder: (context, state) => isLoggedIn
            ? const HomePage()
            : BlocProvider(
                create: (context) => getIt<LoginCubit>(),
                child: const LoginPage(),
              ),
      ),

      // *************************** Auth Routes ***************************
      GoRoute(
        path: AppRoutes.kHomePage,
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: AppRoutes.kRegisterView,
        builder: (context, state) => BlocProvider(
          create: (context) => getIt<RegisterCubit>(),
          child: const RegisterPage(),
        ),
      ),

      // *************************** Dashboard && Product Routes ***************************

      // GoRoute(
      //   path: AppRoutes.kDashboardView,
      //   builder: (context, state) => const DashboardView(),
      // ),

      // GoRoute(
      //   path: AppRoutes.kProductDetailsView,
      //   builder: (context, state) => ProductDetailsView(
      //     productModel: state.extra as ProductModel,
      //   ),
      // ),

      // GoRoute(
      //   path: AppRoutes.kCreateProductView,
      //   builder: (context, state) => const CreateProductView(),
      // ),

      // GoRoute(
      //   path: AppRoutes.kEditProductView,
      //   builder: (context, state) => EditProductView(
      //     product: state.extra as ProductModel,
      //   ),
      // ),

      // *************************** Category Routes ***************************

      // GoRoute(
      //   path: AppRoutes.kCategoryView,
      //   builder: (context, state) => const CategoryView(),
      // ),
      // GoRoute(
      //   path: AppRoutes.kCategoryProductsView,
      //   builder: (context, state) => CategoryProductsView(
      //     categoryModel: state.extra as CategoryModel,
      //   ),
      // ),
      // GoRoute(
      //   path: AppRoutes.kEditCategoryView,
      //   builder: (context, state) => EditCategoryView(
      //     categoryModel: state.extra as CategoryModel,
      //   ),
      // ),
      // GoRoute(
      //   path: AppRoutes.kCreateCategoryView,
      //   builder: (context, state) => const CreateCategoryView(),
      // ),
      // GoRoute(
      //   path: AppRoutes.kDeleteCategoryView,
      //   builder: (context, state) => DeleteCategoryView(
      //     categoryModel: state.extra as CategoryModel,
      //   ),
      // ),

      // *************************** Brand Routes ***************************
      // GoRoute(
      //   path: AppRoutes.kBrandView,
      //   builder: (context, state) => const BrandsView(),
      // ),
      // GoRoute(
      //   path: AppRoutes.kBrandProductsView,
      //   builder: (context, state) => BrandProductsView(
      //     brandModel: state.extra as BrandModel,
      //   ),
      // ),
      // GoRoute(
      //   path: AppRoutes.kEditBrandView,
      //   builder: (context, state) => EditBrandsView(
      //     brandModel: state.extra as BrandModel,
      //   ),
      // ),
      // GoRoute(
      //   path: AppRoutes.kAddBrandView,
      //   builder: (context, state) => const CreateBrandView(),
      // ),
      // GoRoute(
      //   path: AppRoutes.kDeleteBrandView,
      //   builder: (context, state) => DeleteBrandsView(
      //     brandModel: state.extra as BrandModel,
      //   ),
      // ),
    ],
  );
}
