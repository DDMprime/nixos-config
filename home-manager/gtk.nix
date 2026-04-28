{pkgs, ...}: {
    gtk.gtk4 = {
        enable = true;
        theme = {
            name = "Nordic-darker";
            package = pkgs.nordic;
        };
        iconTheme = {
            name = "Nordzy-dark";
            package = pkgs.nordzy-icon-theme;
        };
    };
}
