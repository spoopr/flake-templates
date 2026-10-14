{
    self,
    ...
}: {
    perSystem = {
        pkgs,
        ...
    }: {
        apps = rec {
            default = pdflatex;

            pdflatex = {
                type = "app";

                program = let
                    filepath = builtins.path {
                        path = self.outPath + "/main.tex";
                    };
                in pkgs.writeShellApplication {
                    name = "pdflatex";
                    runtimeInputs = with pkgs; [
                        texliveFull
                    ];

                    text = ''
                        mkdir -p result
                        pdflatex \
                            -jobname=main \
                            -output-directory=result \
                            ${filepath}
                    '';
                };

                meta.mainProgram = "pdflatex";
            };
        };
    };
}
