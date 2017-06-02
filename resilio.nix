self: super:

let
    version = "2.5.12";
    arch = "x64";
in
{
  resilio-sync = super.resilio-sync.overrideDerivation (olds: {
      src = self.fetchurl {
        url = "https://download-cdn.resilio.com/${version}/linux-${arch}/resilio-sync_${arch}.tar.gz";
    	sha256 = "176gf5704wh22kqig8n0gg83048w71grw7h37k2qvxjaf4vypnc7";
      };
  });
}
