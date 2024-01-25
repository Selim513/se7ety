class Model {
  final String titile;
  final String description;
  final String image;

  Model({required this.titile, required this.description, required this.image});
}

List<Model> pageData = [
  Model(
      titile: 'ابحث عن دكتور متخصص',
      description:
          'اكتشف مجموعه واسعه من الأطباء الخبراء والمتخصصين في مختلف المجالات .',
      image: 'asset/on1.svg'),
  Model(
      titile: 'سهوله الحجز',
      description: '  . احجز المواعيد بضغطة زرار في اي وقت واي مكان',
      image: 'asset/on2.svg'),
  Model(
      titile: 'ابحث عن دكتور متخصص',
      description: 'كن مطمئنا خصوصيتك وأمانك هما أهم أولوياتنا ',
      image: 'asset/on3.svg')
];
