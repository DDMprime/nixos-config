{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Network managment
    curl
    ipset
    zapret # обход DPI
    iptables # для zapret'а
    nftables # для zapret'а
    proxychains # для управления прокси
  ];
}
