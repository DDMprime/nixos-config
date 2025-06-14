{ lib, config, ... }:

{
  options = {
    zapret.enable =
      lib.mkEnableOption "enables zapret";
  };


  config = lib.mkIf config.zapret.enable (
    let
      LIST_PATH = "/zapret/lists/list-ultimate.txt";
      DISCORD_IPSET_PATH = "/zapret/lists/ipset-discord.txt";
      CLOUDFLARE_IPSET_PATH = "/zapret/lists/ipset-cloudflare.txt";
    in {
      services.zapret = {

        enable = true;
        udpSupport = true;
        udpPorts = [
          "50000:50100"
          "443"
        ];
        params = [
          "--filter-udp=443 --hostlist=${LIST_PATH} --dpi-desync=fake --dpi-desync-repeats=6 --dpi-desync-fake-quic=/zapret/fake/quic_initial_www_google_com.bin --new"
          "--filter-udp=50000-50100 --ipset=${DISCORD_IPSET_PATH} --dpi-desync=fake --dpi-desync-any-protocol --dpi-desync-cutoff=d3 --dpi-desync-repeats=6 --new"
          "--filter-tcp=80 --hostlist=${LIST_PATH} --dpi-desync=fake,split2 --dpi-desync-autottl=2 --dpi-desync-fooling=md5sig --new"
          "--filter-tcp=443 --hostlist=${LIST_PATH} --dpi-desync=split2 --dpi-desync-split-seqovl=652 --dpi-desync-split-pos=2 --dpi-desync-split-seqovl-pattern=/zapret/fake/tls_clienthello_www_google_com.bin --new"
          "--filter-udp=443 --ipset=${CLOUDFLARE_IPSET_PATH} --dpi-desync=fake --dpi-desync-repeats=6 --dpi-desync-fake-quic=/zapret/fake/quic_initial_www_google_com.bin --new"
          "--filter-tcp=80 --ipset=${CLOUDFLARE_IPSET_PATH} --dpi-desync=fake,split2 --dpi-desync-autottl=2 --dpi-desync-fooling=md5sig --new"
          "--filter-tcp=443 --ipset=${CLOUDFLARE_IPSET_PATH} --dpi-desync=split2 --dpi-desync-split-seqovl=652 --dpi-desync-split-pos=2 --dpi-desync-split-seqovl-pattern=/zapret/fake/tls_clienthello_www_google_com.bin"
        ];
      };
    }
  );
}
