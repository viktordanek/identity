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
                                    name = "generate ssh-key" ;
                                    runtimeImports = [ pkgs.coreutils pkgs.openssh ] ;
                                    text =
                                        ''
                                            set -e
                                            mkdir --parents $1 &&
                                            ssh-keygen -f $1/identity -P "" -C ""
                                        '' ;
                                } ;
        } ;
}
