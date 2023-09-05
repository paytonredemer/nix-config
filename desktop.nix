{ inputs, outputs, .. }:
{
  monitors = [
    {
      name = "DP-5";
      width = 1920;
      height = 1080;
      refreshRate = 60;
      x = 0;
      workspace = "3";
    }
    {
      name = "DP-0";
      width = 1920;
      height = 1080;
      refreshRate = 144;
      x = 1920;
      workspace = "1";
      primary = true;
    }
    {
      name = "DP-2";
      width = 1920;
      height = 1080;
      refreshRate = 60;
      noBar = true;
      x = 3840;
      workspace = "2";
    }
  ];
}
