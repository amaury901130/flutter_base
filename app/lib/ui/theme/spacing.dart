class Spacing {
  final double spacerSize;
  final double xxs;
  final double xs;
  final double s;
  final double m;
  final double l;
  final double xl;
  final double xxl;
  final double xxxl;
  final double xxxxl;
  final double xxxxxl;

  Spacing._({
    this.spacerSize,
    this.xxs,
    this.xs,
    this.s,
    this.m,
    this.l,
    this.xl,
    this.xxl,
    this.xxxl,
    this.xxxxl,
    this.xxxxxl,
  });

  factory Spacing(double spacerSize) {
    return new Spacing._(
      spacerSize: spacerSize,
      xxs: 1 * spacerSize,
      xs: 2 * spacerSize,
      s: 3 * spacerSize,
      m: 4 * spacerSize,
      l: 5 * spacerSize,
      xl: 6 * spacerSize,
      xxl: 7 * spacerSize,
      xxxl: 8 * spacerSize,
      xxxxl: 9 * spacerSize,
      xxxxxl: 10 * spacerSize,
    );
  }
}
