# Page Widget Extraction & Structure Rule

To maintain peak modularity, testability, and clean architecture, each architectural component and widget should reside in its own dedicated file.

## 1. Single Class Per File
- **One Class Per File**: A single `.dart` file must contain exactly one primary class.
- **Intrinsic Exceptions**: Exceptions are only allowed for matched `StatefulWidget` and `State` class pairs, or very small, non-reusable helper models that are absolutely intrinsic to the primary class.
- **Naming**: The filename must strictly match the class name (converted to snake_case).

## 2. Widget Extraction Criteria
- **Complex Sub-widgets**: Private helper widgets or methods like `_buildBottomNavBar`, `_buildAppBar`, `_buildHeader` must be extracted into separate widget files.
- **Page Division**: Large `build` methods or complex page layouts should be divided into a Page class (handling providers/BLoC) and a separate View class (handling UI layout), each in their own file.
- **Location**: Extracted widgets must be placed in `(feature)/presentation/widgets/`.
- **Naming**: Filenames should clearly match the widget's purpose (e.g., `lineage_bottom_nav_bar.dart`).
- **Encapsulation**: Prefer creating a new `StatelessWidget` or `StatefulWidget` instead of just a function returning a widget, for better performance and readability.
- **Public Visibility**: Assess if the extracted widget should be public or keep its private naming if it is only intended for use within that feature's widgets.
