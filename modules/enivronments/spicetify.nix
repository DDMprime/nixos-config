{ inputs, pkgs, ... }:

{
    programs.spicetify =
        let
            spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system};

#             nordSpotify = pkgs.fetchFromGitHub {
#                 owner = "Tetrax-10";
#                 repo = "Nord-Spotify";
#                 rev = "new-ui-support";
#                 #sha256 = "sha256-Or+UBPHjiSSqj0uN1fSIDk6+PqyPDDMcI+jllAsDSOw=";
#                 sha256 = "sha256-YymBv+dvPO1MDjkzlRoG7W0PETFW5KeE9KvXuJHskvY=";
#             };
        in
        {
            enable = true;

            enabledExtensions = with spicePkgs.extensions; [
                adblock
                hidePodcasts
                shuffle # shuffle+ (special characters are sanitized out of extension names)
            ];
            enabledCustomApps = with spicePkgs.apps; [
                newReleases
                ncsVisualizer
            ];
            enabledSnippets = with spicePkgs.snippets; [
                #rotatingCoverart
                pointer
            ];

            theme = spicePkgs.themes.matte;
            #colorScheme = "default";
        };
}
