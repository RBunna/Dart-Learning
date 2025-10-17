class Distance {
  final double _m;

  Distance.km(double length) : this._m = length * 1000;
  Distance.hm(double length) : this._m = length * 100;
  Distance.dam(double length) : this._m = length * 10;
  Distance.m(this._m);
  Distance.dm(double length) : this._m = length / 10;
  Distance.cm(double length) : this._m = length / 100;
  Distance.mm(double length) : this._m = length / 1000;

  Distance operator +(Distance that) => Distance.m(this._m + that._m);
  Distance operator -(Distance that) => Distance.m(this._m - that._m);

  double get km => this._m / 1000;
  double get hm => this._m / 100;
  double get dam => this._m / 10;
  double get m => this._m;
  double get dm => this._m * 10;
  double get cm => this._m * 100;
  double get mm => this._m * 1000;
}

void main(List<String> args) {
  Distance d1 = Distance.mm(1000000);
  Distance d2 = Distance.km(1);

  print("${d1.km}, ${d2.km}");
  print((d1 - d2).km);
}
