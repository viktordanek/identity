{
    inputs = { } ;
    outputs = { self } :
        {
            lib.generator =
                {
                    nixpkgs ,
                    system
                } :
                    let
                        pkgs = import nixpkgs { inherit system ; } ;
                        in
                            pkgs.writeShellApplication
                                {
                                    name = "generate-ssh-key" ;
                                    runtimeInputs = [ pkgs.coreutils pkgs.openssh ] ;
                                    text =
                                        ''
                                            set -e
                                            mkdir --parents /mount/target &&
                                            ssh-keygen -f /mount/target/identity" -P "" -C ""
                                        '' ;
                                } ;
        } ;
}
