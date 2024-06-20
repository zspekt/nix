{ ... }:
{
  hypr =
    # if "${hostname}" == "nixos" then
    #   {
    #
    #   }
    # else
    #   { };

    {
      recursive = true;
      source = ../../../../dotfiles/.config/hypr;
      target = ".config/hypr";
    };
}
