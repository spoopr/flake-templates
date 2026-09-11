{
    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
        
        flake-parts.url = "github:hercules-ci/flake-parts";

        import-tree.url = "github:denful/import-tree";
    };

    outputs = { flake-parts, ... } @ inputs: flake-parts.lib.mkFlake
        { inherit inputs; }
        {
            systems = [
                "x86-64_linux"
            ];

            imports = [
                ./nix
            ];
        };
}
