enum FilterState { newest, oldest, lowToHigh, highToLow, bestSelling, none }

class FilterModel {
  final String name;
  bool isSelected;
  final FilterState filterState;
  FilterModel(
      {required this.name, required this.filterState, this.isSelected = false});
}
