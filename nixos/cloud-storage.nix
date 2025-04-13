{ config, lib, pkgs, ... }:

let
  domainMain = "yugalkhanal.dev";
  domainImmich = "photos.yugalkhanal.dev";
  domainFileCloud = "cloud.yugalkhanal.dev";
  mediaLocation = "/var/lib/immich";
in
{
  services.immich = {
    enable = true;
    mediaLocation = mediaLocation;

    settings = {
      server.externalDomain = "https://${domainImmich}";
      server.loginPageMessage = "Welcome to Yugal's Immich 🗿";
      newVersionCheck.enabled = true;
      oauth = {
        enabled = true;
        buttonText = "Login with Google";
        issuerUrl = "https://accounts.google.com";
        clientId = "OAUTH_CLIENT_ID";
        clientSecret = "OAUTH_CLIENT_SECRET";
      };
      metadata.faces.import = true;
      theme.customCss = ''
        :root {
          /* Gruvbox light */
          --immich-primary: 215 153 33 !important;       /* yellow */
          --immich-bg: 251 241 199 !important;           /* light bg */
          --immich-fg: 60 56 54 !important;              /* dark fg */
          --immich-gray: 235 219 178 !important;         /* soft gray */
          --immich-error: 204 36 29 !important;          /* red */
          --immich-success: 152 151 26 !important;       /* green */
          --immich-warning: 214 93 14 !important;        /* orange */

          /* Gruvbox dark */
          --immich-dark-primary: 250 189 47 !important;  /* bright yellow */
          --immich-dark-bg: 29 32 33 !important;         /* dark bg */
          --immich-dark-fg: 235 219 178 !important;      /* light fg */
          --immich-dark-gray: 60 56 54 !important;       /* soft dark */
          --immich-dark-error: 251 73 52 !important;     /* bright red */
          --immich-dark-success: 184 187 38 !important;  /* bright green */
          --immich-dark-warning: 254 128 25 !important;  /* bright orange */
        }

        /* Hide the Immich logo */
        img[alt="Immich logo"] {
          display: none !important;
        }
      '';
    };
  };

  # Docker & FileCloud
  virtualisation.docker.enable = true;
  users.users.yugalkhanal.extraGroups = [ "docker" ];

  # Nginx setup
  services.nginx = {
    enable = true;

    virtualHosts = {
      # FileCloud reverse proxy
      "${domainFileCloud}" = {
        enableACME = true;
        forceSSL = true;

        extraConfig = ''
          client_max_body_size 1G;
        '';

        locations."/" = {
          proxyPass = "http://localhost:8080";
          proxyWebsockets = true;
          extraConfig = ''
            proxy_set_header Host $host;
            proxy_set_header X-Real-IP $remote_addr;
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_set_header X-Forwarded-Proto $scheme;
          '';
        };
      };

      # Immich reverse proxy
      "${domainImmich}" = {
        enableACME = true;
        forceSSL = true;

        locations."/" = {
          proxyPass = "http://localhost:2283";
          proxyWebsockets = true;
          extraConfig = ''
            proxy_set_header Host $host;
            proxy_set_header X-Real-IP $remote_addr;
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_set_header X-Forwarded-Proto $scheme;
          '';
        };
      };

      # main domain tls cert
      "${domainMain}" = {
        enableACME = true;
        forceSSL = true;

        locations."/" = {
          proxyPass = "http://localhost:1025";
          proxyWebsockets = true;
          extraConfig = ''
            proxy_set_header Host $host;
            proxy_set_header X-Real-IP $remote_addr;
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_set_header X-Forwarded-Proto $scheme;
          '';
        };
      };
    };
  };

  # ACME (Let's Encrypt)
  security.acme = {
    acceptTerms = true;
    defaults.email = "whaaaaaaaaaaaaaaaaaaaaaaaaaat@gmail.com";
  };

  # Immich media directory
  systemd.tmpfiles.rules = [
    "d ${mediaLocation} 0755 immich immich -"
  ];

  # Open firewall
  networking.firewall.allowedTCPPorts = [ 80 443 ];

  # Optional CLI tool
  environment.systemPackages = with pkgs; [ immich-cli ];
}
