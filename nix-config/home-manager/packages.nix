# https://hydra.nixos.org/job/nixpkgs/trunk/krita.x86_64-linux
{
  pkgs,
  lib,
  ...
}: let
  # versions = builtins.fromJSON (builtins.readFile (./. + "/versions.json"));
  # my-pkgs = import ./# my-pkgs.nix {
  #   inherit lib pkgs config versions;
  # };
  packages_dict = with pkgs; {
    inbox = [
      handlr-regex

      # my-pkgs.kanri
      # my-pkgs.promformat

      intel-media-driver # LIBVA_DRIVER_NAME=iHD
      vaapiIntel # LIBVA_DRIVER_NAME=i965 (older but works better for Firefox/Chromium)
      vaapiVdpau
      libvdpau-va-gl
      libva-utils
      glxinfo
      fontforge
    ];

    ent = [
      yt-dlp
      steamcmd
      steam-tui
      parsec-bin # Remote gaming streaming service client
    ];

    docs = [
      newsboat # A fork of Newsbeuter, an RSS/Atom feed reader for the text console

      system-config-printer
      ocrmypdf # Adds an OCR text layer to scanned PDF files
      ocamlPackages.cpdf # PDF Command Line Tools
      # my-pkgs.sane-scan-pdf # Sane command-line scan-to-pdf script
      sane-airscan
      simple-scan

      okular # KDE document viewer

      djvulibre # for emacs doc-tools
      mupdf # for emacs doc-tools

      xournalpp # handwriting Notetaking software with PDF annotation support
    ];

    lib = [
      geoipWithDatabase
    ];

    orga = [
      klog-time-tracker
      kapow # Punch clock to track time spent on projects
    ];

    dot = [
      # my-pkgs.updatecli # Continuously update everything
      chezmoi # Manage your dotfiles across multiple machines
    ];

    cli = {
      dev = [
        angle-grinder # Slice and dice logs on the command line
        cocogitto # The Conventional Commits & semver toolbox
        kubeconform # Tool for validating Kubernetes YAML or JSON configuration files
        kubernetes-polaris # Validate and remediate Kubernetes resources
        step-cli # A zero trust swiss army knife for working with X509, OAuth, JWT, OATH OTP, etc.
        skopeo # A command line utility for various operations on container images and image repositories.
        # my-pkgs.versio # A version number manager
        grex # cli for generating regular expressions from user-provided test cases
      ];

      media = [
        swayimg # Image viewer for Sway/Wayland
        oculante #  minimalistic crossplatform image viewer written in Rust
        vhs # A tool for generating terminal GIFs with code
        termshot # Creates screenshots based on terminal command output
        kdenlive # video editor
        menyoki # Screen{shot,cast} and perform ImageOps on the command line
        satty #  Modern Screenshot Annotation Tool
        ksnip # screenshot tool wihth many annotation features
        bluetuith # A TUI bluetooth manager for Linux.
      ];

      data = {
        logs = [
          snazy # A snazzy json log viewer
          fblog # A small command-line JSON log viewer
        ];

        json = [
          jless # A command-line pager for JSON data
          jq # Command-line JSON processor
          gojq # Pure Go implementation of jq
          ijq # Interactive wrapper for jq
          gron # Make JSON greppable!
          tv # Format json into table view
          jc # serializes the output of popular command line tools to structured JSON output
        ];

        tools = [
          bcal # Storage conversion and expression calculator
          fend # Arbitrary-precision unit-aware calculator
          eva # A calculator REPL, similar to bc
          # my-pkgs.sttr # cli to perform various operations on string
        ];

        csv = [
          csvlens # Command line csv viewer
          tidy-viewer # CLI csv pretty printer
        ];

        pipe = [
          miller # Like awk, sed, cut, join, and sort for data formats such as CSV, TSV, JSON, JSON Lines, and positionally-indexed
          dasel # Query and update data structures from the command line.
          sd # Intuitive find & replace
          ruplacer # Find and replace text in source files
          rnr # A command-line tool to batch rename files and directories
          # my-pkgs.desed # Debugger for Sed
          teip # A tool to bypass a partial range of standard input to any command
          # TODO
          # tree-grepper # Like grep, but uses tree-sitter grammars to search
          zet # CLI utility to find the union, intersection, set difference, etc of files considered as sets of lines
        ];
      };

      misc = [
        espeak # Open source speech synthesizer that supports over 70 languages, based on eSpeak
        wthrr # Weather companion for the terminal
      ];

      mobile = [
        android-tools
        scrcpy # Display and control your Android device
      ];

      pipe = [
        choose # A human-friendly and fast alternative to cut and (sometimes) awk
        sad # CLI tool to search and replace
      ];

      backup = [
        backblaze-b2 # Command-line tool for accessing the Backblaze B2 storage service
        snapper # A tool for managing BTRFS and LVM snapshots
        httm # Interactive, file-level Time Machine-like tool for ZFS/btrfs
        gitwatch
        rclone # CLI to sync files and directories to and from major cloud storage
      ];

      tools = [
        age # Modern encryption tool with small explicit keys
        b3sum # BLAKE3 cryptographic hash function
        bat # Cat clone with syntax highlighting and git integration
        moar # Nice-to-use pager for humans
        broot # Fuzzy Search + tree + cd
        as-tree # Print a list of paths as a tree of paths
        gtree # Generate directory tree and the directories folder using Markdown or Programmatically

        tealdeer # tldr in Rust
        the-way # Terminal code snippets manager

        delta # A syntax-highlighting pager for git
        difftastic # A syntax-aware diff
        diffsitter # A tree-sitter based AST difftool to get meaningful semantic diffs
        python3Packages.graphtage # diff tree-like files such as JSON and XML
        dyff #  A diff tool for YAML files, and sometimes JSON
        riffdiff # A diff filter highlighting which line parts have changed
        yamllint
        dig
        dogdns # Command-line DNS client like dig

        oath-toolkit # oathtool
        gopass # The slightly more awesome standard unix password manager for teams.
        gopass-summon-provider # summon provider for gopass
        tessen # An interactive menu to autotype and copy Pass and GoPass data

        gpg-tui # A terminal user interface for GnuPG

        gum # Tasty Bubble Gum for your shell

        just # A handy way to save and run project-specific commands
        go-task # A task runner / simpler Make alternative

        mani # A CLI tool that helps you manage multiple repositories
        ookla-speedtest # Internet speedtest tool

        ouch # Painless compression and decompression in the terminal (git version)

        podman # Tool and library for running OCI-based containers in pods
        # TODO: aardvark-dns
        podman-compose # A script to run docker-compose.yml using podman

        nerdctl # CLI for containerd

        rsync # Fast incremental file transfer utility

        summon # CLI that provides on-demand secrets access for common DevOps tools

        termscp # A feature rich terminal UI file transfer and explorer
        termshark # Terminal UI for tshark, inspired by Wireshark
        wireshark # Powerful network protocol analyzer

        viddy # A modern watch command
        watchexec # Executes commands in response to file modifications

        yq-go # Portable command-line YAML processor

        zbar # Application and library for reading bar codes from various sources

        libqalculate # An advanced calculator library

        # my-pkgs.got # CLI to download large files faster than cURL and Wget

        font-manager
      ];
    };

    dev = {
      net = [
        checkip # CLI tool that checks an IP address using various public services
        gping # Ping, but with a graph
        xh # Friendly and fast tool for sending HTTP requests
        mtr # Combines the functionality of traceroute and ping
        rustcat # Port listener and reverse shell (netcat clone)
        nmap # A free and open source utility for network discovery and security auditing
        rustscan # Faster Nmap Scanning with Rust
        socat # Utility for bidirectional data transfer between two independent data channels
        sshuttle # Transparent proxy server that works as a poor man's VPN
        upterm # Secure terminal-session sharing
        sslscan # Tests SSL/TLS services and discover supported cipher suites
        websocat # Command-line client for WebSockets (like netcat/socat)
      ];

      http = [
        ain # A HTTP API client for the terminal
        curl
        curlie # Frontend to curl that adds the ease of use of httpie, without compromising on features and performance
        httpie # A command line HTTP client whose goal is to make CLI human-friendly
        http-prompt # An interactive HTTP command-line client
      ];

      protocols = [
        altair # A feature-rich GraphQL Client IDE
        grpcurl # Like cURL, but for gRPC: Command-line tool for interacting with gRPC servers
        grpc-client-cli # generic gRPC command line client
        # my-pkgs.protocurl # cURL for Protobuf
        swaks # Swiss Army Knife SMTP; Command line SMTP testing, including TLS and AUTH
      ];

      docs = [
        asciidoctor-with-extensions
        akira-unstable # Native Linux Design application
        drawio # A desktop application for creating diagrams
        graphviz # Graph visualization tools
        plantuml # Component that allows to quickly write uml diagrams
        pandoc

        d2 # A modern diagram scripting language that turns text to diagrams

        glow # Command-line markdown renderer
        inlyne # A GPU powered browserless markdown viewer

        # TODO: slidev  https://sli.dev/guide/install.html#starter-template
        python3Packages.grip # Preview GitHub Markdown files like Readme locally before committing them
      ];

      general = [
        seer # A Qt gui frontend for GDB
        mold # A faster drop-in replacement for existing Unix linkers
        aichat
        powershell
      ];

      cn = [
        argo # Container native workflow engine for Kubernetes
        argocd # Declarative continuous deployment for Kubernetes
        # TODO: nixos
        # azure-cli
        civo
        humioctl
        k6 # A modern load testing tool, using Go and JavaScript
        istioctl
        awscli2
        mimir # Grafana Mimir
        grafana
        pulumi-bin
        minio-client
        s3cmd # Command line tool for managing Amazon S3 and CloudFront services
        sops # Mozilla sops (Secrets OPerationS) is an editor of encrypted files
        opentofu
        terraform # HashiCorp tool for building and updating infrastructure as code idempotently
        terraform-docs # A utility to generate documentation from Terraform modules in various output formats
        nodePackages.cdktf-cli # CDK for Terraform CLI
        tektoncd-cli # CLI for interacting with Tekton
        terraform-ls # Terraform Language Server
        tflint # Terraform linter
      ];

      cicd = [
        # codeowners
      ];

      edit = [
        pkgs.emacs-overlay.emacs-pgtk
        # my-pkgs.commitlint-rs
        helix #  A post-modern modal text editor
        stylua # Code formatter for Lua
        treefmt
        dprint # Code formatting platform written in Rust
        tokei # A program that allows you to count your code, quickly
        tree-sitter-grammars.tree-sitter-yaml
        devbox # Instant, easy, predictable shells and containers.
        direnv # A shell extension that manages your environment
        nix-direnv-flakes # A fast, persistent use_nix implementation for direnv
        # tree-sitter-grammars.tree-sitter-toml

        focuswriter # Simple, distraction-free writing environment
        nuspell
        enchant
        hunspellDicts.de-de
        hunspellDicts.en-us
      ];

      lang = {
        webdev = [
          deno # A secure runtime for JavaScript and TypeScript
          nodejs_latest
          yarn # Fast, reliable, and secure dependency management
          nodePackages.pnpm

          nodePackages.npm-check-updates # Find newer versions of dependencies than what your package.json allows
          nodePackages.typescript-language-server # Language Server Protocol (LSP) implementation for TypeScript using tsserver
        ];

        java = [
          eclipse-mat # Fast and feature-rich Java heap analyzer
          visualvm # A visual interface for viewing information about Java application
          jetbrains.idea-community # IDE by Jetbrains, community edition
        ];

        misc = [
          go-jsonnet
          xxHash # Extremely fast hash algorithm
        ];

        c = [
          rtags # C/C++ client-server indexer based on clang
        ];

        frameworks = [
          dioxus-cli #CLI tool for developing, testing, and publishing Dioxus apps
        ];

        latex = [
          tectonic # Modernized, complete, self-contained TeX/LaTeX engine
        ];

        db = [
          # my_pkgs.cqlsh # cli for interacting with Cassandra using CQL
          mongosh # The MongoDB Shell
          mongodb-tools
          sqlcmd # A command line tool for working with Microsoft SQL Server, Azure SQL Database
          redli # A humane alternative to the Redis-cli and TLS
          usql # A universal command-line interface for SQL databases
        ];
      };

      util = [
        dtool # CLI tool collection to assist development
      ];

      data = [
        dbeaver # Universal SQL Client for developers, DBA and analysts. Supports MySQL, PostgreSQL, MariaDB, SQLite, and more
        # my-pkgs.qsv #  CSVs sliced, diced & analyzed.
      ];
    };

    lang = {
      go = [
        ginkgo # A Modern Testing Framework for Go
        golangci-lint # Fast linters Runner for Go
        gotools # Additional tools for Go development
        gotestsum # A human friendly `go test` runner
        delve # A debugger for the Go programming language.
        gdlv # GUI frontend for Delve
        go # Core compiler tools for the Go programming language
        gopls # Language server for Go programming language
        go-tools # Developer tools for the Go programming language
        revive # Fast, configurable, extensible, flexible, and beautiful linter for Go
      ];

      jvm = [
        gradle # Powerful build system for the JVM
        maven # Java project management and project comprehension tool
      ];

      python = [
        black # The uncompromising Python code formatter
        python3Packages.flake8 # The modular source code checker
        py-spy # Sampling profiler for Python programs
        memray
        mypy # Optional static typing for Python 2 and 3 (PEP484)
        # TODO: build failure
        # poetry # Python dependency management and packaging made easy.
        pyright # Type checker for the Python language
        ruff # An extremely fast Python linter
        twine # Collection of utilities for interacting with PyPI
        virtualenv
      ];

      rust = [
        cargo-edit # Managing cargo dependencies from the command line
        cargo-make # Rust task runner and build tool
        cargo-generate
        # required for topgrade cargo step
        cargo-update # A cargo subcommand for checking and applying updates to installed executables

        # TODO
        # rust-bin.stable.latest.default
      ];

      shell = [
        shfmt # A shell parser and formatter
        nodePackages.bash-language-server
        nushellFull # A modern shell written in Rust
      ];

      xml = [
        # my-pkgs.xmlformatter
      ];
    };

    desktop = {
      cli = [
        croc # Easily and securely send things from one computer to another

        grim # Grab images from a Wayland compositor
        hydroxide # A third-party, open-source ProtonMail CardDAV, IMAP and SMTP bridge

        topgrade # Invoke the upgrade procedure of multiple package managers
        ripgrep
        ripgrep-all # Ripgrep, but also search in PDFs, E-Books, Office documents, zip, tar.gz, and more
        amber # A code search-and-replace tool
        slurp # Select a region in a Wayland compositor
        tmpmail # A temporary email right from your terminal written in POSIX sh
      ];

      wm = [
        i3status-rust
        cliphist # Wayland clipboard manager
        wob # A lightweight overlay bar for Wayland
        (rofi-wayland.override {
          plugins = [rofi-calc];
        })
        wtype
        pinentry-rofi
      ];

      docs = [
        deskew # deskewing scanned text documents
        paperwork # Personal document manager
        # my-pkgs.wutag # CLI tool for tagging and organizing files by tags
        simple-scan
        tesseract # An OCR program
        unpaper # Post-processing tool for scanned sheets of paper
        zathura # A highly customizable and functional PDF viewer
      ];

      odre = [
        kbfs # The Keybase filesystem
        keybase
        keybase-gui

        nvchecker # New version checker for software
      ];
    };

    bizz = {
      fin = [
        electrum # A lightweight Bitcoin wallet
      ];
    };

    media = {
      cli = [
        visidata # Interactive terminal multitool for tabular data

        # For emacs-gif-screencast
        gifsicle # Command-line tool for creating, editing, and getting information about GIF images and animations

        # TODO: not sure if these are needed (directly)
        gifski # GIF encoder based on libimagequant (pngquant)
        pngquant # Command-line utility to quantize PNGs down to 8-bit paletted PNGs

        image_optim # Command line to optimize jpeg, png, gif and svg images using external utilities (advpng, gifsicle, jhead, jpeg-recompress, jpegoptim, jpegrescan, jpegtran, optipng, pngcrush, pngout, pngquant, svgo)
        oxipng # A multithreaded lossless PNG compression optimizer

        # TODO: picopt instead of image_optim (create custom image)
      ];

      images = [
        krita # Edit and paint images
        pinta # Drawing/editing program modeled after Paint.NET
        gimp # The GNU Image Manipulation Program
        epick # Color picker for creating harmonic color palettes
        pastel # A command-line tool to generate, analyze, convert and manipulate colors
      ];
      video = [
        obs-studio # Free, open source software for live streaming and recording
        streamlink # CLI for extracting streams from various websites to video player of your choosing
        streamlink-twitch-gui-bin # Twitch.tv browser for Streamlink
      ];

      audio = [
        cozy # A modern audio book player for Linux using GTK 3

        # TODO: collision with gotools
        # https://github.com/NixOS/nixpkgs/issues/275392
        # sox # The Swiss Army knife of sound processing tools
      ];

      comm = [
        mumble # low-latency, high quality voice chat software
        linphone
        tiny # A console IRC client
        signal-desktop
      ];
    };

    shell = {
      tools = [
        eza # ls replacement
        fd # A simple, fast and user-friendly alternative to find
        pueue # A daemon for managing long running shell commands
        fzf # Command-line fuzzy finder
        sysz # A fzf terminal UI for systemctl
        xplr # A hackable, minimal, fast TUI file explorer
        nnn # file browser forked from noice
      ];

      core = [
        wezterm
        atuin # Replacement for a shell history which records additional commands context
        sheldon # Fast, configurable, shell plugin manager
      ];
    };

    pim = {
      all = [
        davmail # A Java application which presents a Microsoft Exchange server as local CALDAV, IMAP and SMTP servers

        khal # CLI calendar application build around CalDAV
        khard # Console carddav client
        mailctl # Provide IMAP/SMTP clients with OAuth2 credentials
        mu # A collection of utilities for indexing and searching Maildirs
        mblaze #  maildir utils
      ];

      bookmarks = [
        buku # Private cmdline bookmark manager
        bukubrow # A WebExtension for Buku, a command-line bookmark manager
        oil-buku # Search-as-you-type cli frontend for the buku bookmarks manager using peco
      ];
    };

    system = {
      cli = [
        flashrom
        bottom # A cross-platform graphical process/system monitor with a customizable interface
        clamav # Anti-virus toolkit for Unix
        inxi # A full featured CLI system information tool
        lshw
        hwinfo
        ddcutil # Query and change Linux monitor settings using DDC/CI and USB
        procs # A modern replacement for ps written in Rust
        xdg-ninja # A shell script which checks your $HOME for unwanted files and directories

        # trashy # A simple, fast, and featureful alternative to rm and trash-cli
        # my-pkgs.gtrash # trash

        nethogs # A small 'net top' tool, grouping bandwidth by process
      ];

      disk = [
        btdu # Sampling disk usage profiler for btrfs
        du-dust # du + rust = dust. Like du but more intuitive
        erdtree # File-tree visualizer and disk usage analyzer
        dua # A tool to conveniently learn about the disk usage of directories, fast!
        duf # Disk Usage/Free Utility
        godu # Utility helping to discover large files/folders
        czkawka # remove unnecessary files from your computer
      ];
    };

    entertain = {
      gaming = [
        # wine-wayland # An Open Source implementation of the Windows API on top of OpenGL and Unix
        # bottles # An easy-to-use wineprefix manager

        lutris # Open Source gaming platform for GNU/Linux
      ];

      media = [
      ];

      productivity = [
        blanket # Improve focus and increase your productivity by listening to different sounds
        # my-pkgs.focus
        minder
      ];
    };
  };

  packages = with pkgs; {
    cli = [
    ];

    pers = [
      ledger # Double-entry accounting system with a command-line reporting interface
      reckon # Flexibly import bank account CSV files into Ledger for command line accounting
    ];

    media = [
      ffmpeg
      imagemagick
    ];

    vms = [
      libguestfs # Access and modify virtual machine disk images
      # todo nixos
      # quickemu # Quickly create and run optimised Windows, macOS and Linux desktop virtual machines.
      tigervnc
      vagrant # Build and distribute virtualized development environments
      virt-viewer # A lightweight interface for interacting with the graphical display of virtualized guest OS.
      incus
      distrobuilder # System container image builder for LXC and LXD
      x11docker # Run graphical applications with Docker
    ];

    system = [
      batsignal # A lightweight battery monitor daemon
      mako # Lightweight notification daemon for Wayland
      pamixer # Pulseaudio command-line mixer like amixer
    ];

    backup = [
      restic
      autorestic

      dura # A background process that saves uncommitted changes on git
    ];

    shell = [
      starship # The cross-shell prompt for astronauts
      zoxide # A fast cd command that learns your habits
    ];

    nix = [
      alejandra # The Uncompromising Nix Code Formatter
      comma # Comma runs software without installing it.
      hydra-check # check hydra for the build status of a package
      nil # Yet another language server for Nix
      nixos-generators
      nix-prefetch-git #  Script used to obtain source hashes for fetchgit
      nix-tree
      nix-init # Generate Nix packages from URLs
      nix-search-cli

      nixos-shell
      node2nix
    ];

    tools = [
      ansible # Official assortment of Ansible collections
      ansible-lint # Checks playbooks for practices and behaviour that could potentially be improved.
      python3Packages.mitogen # Python Library for writing distributed self-replicating programs

      python3Packages.qrcode # Quick Response code generation for Python

      dhcping # Send DHCP request to find out if a DHCP server is running

      rathole # A reverse proxy for NAT traversal
      frp # A fast reverse proxy to help you expose a local server behind a NAT or firewall to the internet.

      miniserve # CLI tool to serve files and directories over HTTP
      ngrok # secure introspectable tunnels to localhost
      ventoy # A new multiboot USB solution (Binary)
    ];

    dev = [
      # TODO: build failure
      # checkov # Static code analysis tool for infrastructure-as-code
      caddy # Fast, cross-platform HTTP/2 web server with automatic HTTPS
      cosign # Container Signing CLI with support for ephemeral keys and Sigstore signing
      doctl # The official command line interface for the DigitalOcean API

      mob # Tool for smooth git handover
      git
      git-trim # Automatically trims your branches whose tracking remote refs are merged or gone

      gh # GitHub CLI tool
      glab # GitLab CLI tool
      go-mockery # A mock code autogenerator for golang
      google-cloud-sdk # A set of command-line tools for the Google Cloud Platform. Includes gcloud (with beta and alpha commands), gsutil, and bq.
      gsctl # The Giant Swarm command line interface
      hexyl # A command-line hex viewer
      jwt-cli # A super fast CLI tool to decode and encode JWTs
      ktlint # An anti-bikeshedding Kotlin linter with built-in formatter
      # TODO: build failure
      # mitmproxy # SSL-capable man-in-the-middle HTTP proxy
      packer # tool for creating identical machine images for multiple platforms from a single source configuration
      pluto # A cli tool to help discover deprecated apiVersions in Kubernetes
      prometheus # An open-source systems monitoring and alerting toolkit
      protobuf # Google's data interchange format
      nodePackages.prettier # An opinionated code formatter for JS, JSON, CSS, YAML and much more
      shellcheck # Shell script analysis tool (binary release)
    ];

    k8s = [
      helmfile # Deploy Kubernetes Helm Charts
      vals # Helm-like configuration values loader with support for various sources
      krew # Krew is the package manager for kubectl plugins.
      kubectl # Kubernetes.io client binary
      kubelogin # A Kubernetes credential plugin implementing Azure authentication
      kubeswitch
      stern # Multi pod and container log tailing for Kubernetes
      kubeshark # The API traffic viewer for Kubernetes. Think TCPDump and
      kubernetes-helm # The Kubernetes Package Manager
      kustomize # Template-free customization of Kubernetes YAML manifests
      telepresence2 # Local development against a remote Kubernetes or OpenShift cluster
    ];

    apps = [
      gnome-podcasts # Podcast application for GNOME
      inkscape # Professional vector graphics editor
      libreoffice-fresh # LibreOffice branch which contains new features and program enhancements

      mpv # a free, open source, and cross-platform media player

      tenacity # FLOSS Audacity Fork. No telemetry, crash reports and other shenanigans like that!

      # TODO: nixos
      # zoom-us # Video Conferencing and Web Conferencing Service

      # https://nixos.wiki/wiki/Accelerated_Video_Playback
      intel-media-driver
    ];

    unused = [
      ugrep # ultra fast grep with interactive TUI, fuzzy search, boolean queries, hexdumps and more
    ];
  };
in {
  home.packages =
    packages.cli
    ++ packages.system
    ++ packages.apps
    ++ packages.media
    ++ packages.dev
    ++ packages.pers
    ++ packages.shell
    ++ packages.vms
    ++ packages.nix
    ++ packages.tools
    ++ packages.backup
    ++ packages.k8s
    ++ builtins.concatLists (lib.attrsets.collect builtins.isList packages_dict);

  systemd.user.sessionVariables.DOCKER_HOST = "unix://$XDG_RUNTIME_DIR/podman/podman.sock";
}