{ lib, config, ... }:

{
  options = {
    zapret.enable =
      lib.mkEnableOption "enables zapret";
  };


  config = lib.mkIf config.zapret.enable (
    let
      LIST_PATH = "/zapret/lists/list-zapret.txt";
#       DISCORD_IPSET_PATH = "/zapret/lists/ipset-discord.txt";
#       CLOUDFLARE_IPSET_PATH = "/zapret/lists/ipset-cloudflare.txt";
      ALL_IPSET = "/zapret/lists/ipset-all.txt";
#       QUICK_INITIAL = "/zapret/fake/quic_initial_www_google_com.bin";
#       CLIENT_HELLO = "/zapret/fake/tls_clienthello_www_google_com.bin";
    in {
      services.zapret = {

        enable = true;
        udpSupport = true;
        udpPorts = [
          "19294:19344"
          "50000:50100"
          "443"
          "1024:65535"
        ];

        blacklist = [ "search.nixos.org" ];

#         params = [
#           "--filter-udp=443 --hostlist=${LIST_PATH} --dpi-desync=fake --dpi-desync-repeats=6 --dpi-desync-fake-quic=/zapret/fake/quic_initial_www_google_com.bin --new"
#           "--filter-udp=50000-50100 --ipset=${DISCORD_IPSET_PATH} --dpi-desync=fake --dpi-desync-any-protocol --dpi-desync-cutoff=d3 --dpi-desync-repeats=6 --new"
#           "--filter-tcp=80 --hostlist=${LIST_PATH} --dpi-desync=fake,split2 --dpi-desync-autottl=2 --dpi-desync-fooling=md5sig --new"
#           "--filter-tcp=443 --hostlist=${LIST_PATH} --dpi-desync=split2 --dpi-desync-split-seqovl=652 --dpi-desync-split-pos=2 --dpi-desync-split-seqovl-pattern=/zapret/fake/tls_clienthello_www_google_com.bin --new"
#           "--filter-udp=443 --ipset=${CLOUDFLARE_IPSET_PATH} --dpi-desync=fake --dpi-desync-repeats=6 --dpi-desync-fake-quic=/zapret/fake/quic_initial_www_google_com.bin --new"
#           "--filter-tcp=80 --ipset=${CLOUDFLARE_IPSET_PATH} --dpi-desync=fake,split2 --dpi-desync-autottl=2 --dpi-desync-fooling=md5sig --new"
#           "--filter-tcp=443 --ipset=${CLOUDFLARE_IPSET_PATH} --dpi-desync=split2 --dpi-desync-split-seqovl=652 --dpi-desync-split-pos=2 --dpi-desync-split-seqovl-pattern=/zapret/fake/tls_clienthello_www_google_com.bin"
#         ];
        # params = [
        #   "--filter-udp=443 --hostlist=${LIST_PATH} --dpi-desync=fake --dpi-desync-repeats=6 --dpi-desync-fake-quic=/zapret/fake/quic_initial_www_google_com.bin --new"
        #   "--filter-udp=50000-50100 --filter-l7=discord,stun --dpi-desync=fake --dpi-desync-repeats=6 --new"
        #   "--filter-tcp=80 --hostlist=${LIST_PATH} --dpi-desync=fake,multisplit --dpi-desync-autottl=2 --dpi-desync-fooling=md5sig --new"
        #   "--filter-tcp=443 --hostlist=${LIST_PATH} --dpi-desync=multisplit --dpi-desync-split-seqovl=652 --dpi-desync-split-pos=2 --dpi-desync-split-seqovl-pattern=/zapret/fake/tls_clienthello_www_google_com.bin --new"
        #   "--filter-udp=443 --ipset=${ALL_IPSET} --dpi-desync=fake --dpi-desync-repeats=6 --dpi-desync-fake-quic=/zapret/fake/quic_initial_www_google_com.bin --new"
        #   "--filter-tcp=80 --ipset=${ALL_IPSET} --dpi-desync=fake,multisplit --dpi-desync-autottl=2 --dpi-desync-fooling=md5sig --new"
        #   "--filter-tcp=443,1024-65535 --ipset=${ALL_IPSET} --dpi-desync=multisplit --dpi-desync-split-seqovl=652 --dpi-desync-split-pos=2 --dpi-desync-split-seqovl-pattern=/zapret/fake/tls_clienthello_www_google_com.bin --new" # game filter
        #   "--filter-udp=1024-65535 --ipset=${ALL_IPSET} --dpi-desync=fake --dpi-desync-autottl=2 --dpi-desync-repeats=12 --dpi-desync-any-protocol=1 --dpi-desync-fake-unknown-udp=/zapret/fake/quic_initial_www_google_com.bin --dpi-desync-cutoff=n2 --new" # game filter
        #   "--filter-tcp=443 --hostlist-domains=itch.io,img.itch.zone,html-classic.itch.zone --dpi-desync=fake,fakedsplit --dpi-desync-fake-tls-mod=sni=none --dpi-desync-split-seqovl=681 --dpi-desync-fooling=badseq --dpi-desync-badseq-increment=7000 --new"
        #   "--filter-tcp=6695-6710 --dpi-desync=fake,split2 --dpi-desync-repeats=8 --dpi-desync-fooling=md5sig --dpi-desync-autottl=2 --dpi-desync-fake-tls=/zapret/fake/tls_clienthello_www_google_com.bin"
        # ];
        params = [
        # UDP 443 - General Hostlist
          "--filter-udp=443 --hostlist=${LIST_PATH} --dpi-desync=fake --dpi-desync-repeats=6 --dpi-desync-fake-quic=/zapret/fake/quic_initial_www_google_com.bin --new"

          # Discord UDP (Voice/STUN)
          "--filter-udp=19294-19344,50000-50100 --filter-l7=discord,stun --dpi-desync=fake --dpi-desync-fake-discord=/zapret/fake/quic_initial_www_google_com.bin --dpi-desync-fake-stun=/zapret/fake/quic_initial_www_google_com.bin --dpi-desync-repeats=6 --new"

          # Discord TCP (Media/Image Servers)
          "--filter-tcp=2053,2083,2087,2096,8443 --hostlist-domains=discord.media --dpi-desync=hostfakesplit --dpi-desync-repeats=4 --dpi-desync-fooling=ts --dpi-desync-hostfakesplit-mod=host=ozon.ru --new"

          # Google Services (youtube) (TCP 443)
          "--filter-tcp=443 --hostlist=/zapret/lists/list-google.txt --dpi-desync=fakedsplit --dpi-desync-fooling=badseq --dpi-desync-badseq-increment=0 --dpi-desync-split-pos=method+2 --new"

          # General TCP (80, 443)
          "--filter-tcp=80,443 --hostlist=${LIST_PATH} --dpi-desync=hostfakesplit --dpi-desync-repeats=4 --dpi-desync-fooling=ts,md5sig --dpi-desync-hostfakesplit-mod=host=ozon.ru --new"

          # UDP 443 - IPSET All
          "--filter-udp=443 --ipset=${ALL_IPSET} --dpi-desync=fake --dpi-desync-repeats=6 --dpi-desync-fake-quic=/zapret/fake/quic_initial_www_google_com.bin --new"

          # TCP IPSET + Games (1024-65535)
          "--filter-tcp=80,443,1024-65535 --ipset=${ALL_IPSET} --dpi-desync=hostfakesplit --dpi-desync-repeats=4 --dpi-desync-fooling=ts --dpi-desync-hostfakesplit-mod=host=ozon.ru --new"

          # UDP Games (1024-65535)
          "--filter-udp=1024-65535 --ipset=${ALL_IPSET} --dpi-desync=fake --dpi-desync-autottl=2 --dpi-desync-repeats=12 --dpi-desync-any-protocol=1 --dpi-desync-fake-unknown-udp=/zapret/fake/quic_initial_www_google_com.bin --dpi-desync-cutoff=n2 --new"

          # Warframe
          "--filter-tcp=6695-6710 --dpi-desync=fake,split2 --dpi-desync-repeats=8 --dpi-desync-fooling=md5sig --dpi-desync-autottl=2 --dpi-desync-fake-tls=/zapret/fake/tls_clienthello_www_google_com.bin"
        ];
       };
      networking.firewall.extraCommands = "
        ip46tables -t mangle -I POSTROUTING -p tcp --dport 12 -m mark ! --mark 0x40000000/0x40000000 -j NFQUEUE --queue-num 200 --queue-bypass
        ip46tables -t mangle -I POSTROUTING -p tcp --dport 6695:6710 -m mark ! --mark 0x40000000/0x40000000 -j NFQUEUE --queue-num 200 --queue-bypass
        ip46tables -t mangle -I POSTROUTING -p tcp --dport 2053 -m mark ! --mark 0x40000000/0x40000000 -j NFQUEUE --queue-num 200 --queue-bypass
        ip46tables -t mangle -I POSTROUTING -p tcp --dport 2083 -m mark ! --mark 0x40000000/0x40000000 -j NFQUEUE --queue-num 200 --queue-bypass
        ip46tables -t mangle -I POSTROUTING -p tcp --dport 2087 -m mark ! --mark 0x40000000/0x40000000 -j NFQUEUE --queue-num 200 --queue-bypass
        ip46tables -t mangle -I POSTROUTING -p tcp --dport 2096 -m mark ! --mark 0x40000000/0x40000000 -j NFQUEUE --queue-num 200 --queue-bypass
        ip46tables -t mangle -I POSTROUTING -p tcp --dport 8443 -m mark ! --mark 0x40000000/0x40000000 -j NFQUEUE --queue-num 200 --queue-bypass
      ";
    }
  );
}
