from libqtile import layout
from libqtile.config import Match

layout_theme = {
    "border_width": 1,
    "margin": 12,
    "border_focus": "FFFFFF",
    "border_normal": "1D2330"
}

layouts = [
    layout.Columns(insert_position = 1, **layout_theme),
    # layout.Max(),
    # layout.Stack(num_stacks=2),
    layout.Bsp(fair=False, **layout_theme),
    # layout.Matrix(),
    # layout.MonadTall(),
    # layout.MonadWide(),
    # layout.RatioTile(),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]

floating_layout = layout.Floating(
    float_rules=[
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(wm_class="com.vixalien.sticky"), # stick-notes
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
        Match(title="zoom"),
    ]
)
