{
    inputs,
    ...
}: let
    inherit (inputs) import-tree;
in {
    imports = [(
        import-tree.match
            ".+\/default\.nix"
            ./.
    )];
}
