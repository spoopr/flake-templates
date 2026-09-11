{
    inputs,
    lib,
    ...
}: let
    inherit (inputs) import-tree;
in {
    flake.templates = import-tree
        |> (x: x.match ".*\/flake\.nix")
        |> (x: x.leaves ./.)
        |> map (x: x
            |> lib.path.removePrefix ./.
            |> lib.path.subpath.components
            |> (list: lib.sublist
                0
                (builtins.length list - 1)
                list
            )
        )
        |> map (components: lib.setAttrByPath
            (components ++ ["path"])
            (components
                |> lib.concatStringsSep "/"
                |> (x: "/" + x)
                |> (x: ./. + x)

            )
        )
        |> lib.mergeAttrsList;
}
