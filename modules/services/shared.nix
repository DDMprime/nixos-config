

{
  services.samba = {
    enable = true;
    openFirewall = true;
    shares = {
      public = {
        path = "/home/твое_имя_пользователя/Shared";
        browseable = true;
        writable = true;
        guestOk = true;
      };
    };
  };
}
