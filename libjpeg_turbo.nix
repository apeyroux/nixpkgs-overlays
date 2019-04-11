self: super:

{
  libjpeg_turbo = super.libjpeg_turbo.overrideDerivation(o: {
    doCheck = false;
  });
  libjpeg = super.libjpeg.overrideDerivation(o: {
    doCheck = false;
  });
}
