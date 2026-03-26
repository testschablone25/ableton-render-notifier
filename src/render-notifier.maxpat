{
  "fileversion": 1,
  "appversion": "8.6.0",
  "boxes": [
    {
      "maxclass": "panel",
      "patching_rect": [
        40,
        0,
        760,
        550
      ],
      "id": "background",
      "style": {
        "bgcolor": [
          248,
          242,
          255,
          255
        ],
        "bordercolor": [
          255,
          182,
          193,
          255
        ],
        "borderthickness": 5,
        "cornerradius": 10
      }
    },
    {
      "maxclass": "comment",
      "text": "\ud83d\udc30 Render Notifier \ud83d\udc2e",
      "patching_rect": [
        50,
        10,
        200,
        30
      ],
      "id": "title",
      "fontsize": 16,
      "fontface": 1,
      "style": {
        "bgcolor": [
          248,
          242,
          255,
          255
        ],
        "textcolor": [
          93,
          93,
          129,
          255
        ],
        "bordercolor": [
          255,
          182,
          193,
          255
        ],
        "borderthickness": 5,
        "cornerradius": 10
      }
    },
    {
      "maxclass": "newobj",
      "text": "live.observer is_rendering",
      "patching_rect": [
        50,
        80,
        120,
        22
      ],
      "id": "observer"
    },
    {
      "maxclass": "newobj",
      "text": "sel 0 1",
      "patching_rect": [
        50,
        110,
        60,
        22
      ],
      "id": "sel"
    },
    {
      "maxclass": "newobj",
      "text": "t b b",
      "patching_rect": [
        50,
        140,
        40,
        22
      ],
      "id": "trigger"
    },
    {
      "maxclass": "comment",
      "text": "Observer watches live_set.is_rendering\nOutput 1 when rendering starts, 0 when it stops.\nWe only care about the stop (0) -> trigger bang.",
      "patching_rect": [
        200,
        50,
        200,
        60
      ],
      "id": "comment1"
    },
    {
      "maxclass": "newobj",
      "text": "play~",
      "patching_rect": [
        50,
        250,
        60,
        22
      ],
      "id": "play"
    },
    {
      "maxclass": "newobj",
      "text": "gain~",
      "patching_rect": [
        120,
        250,
        60,
        22
      ],
      "id": "gain"
    },
    {
      "maxclass": "newobj",
      "text": "switch~",
      "patching_rect": [
        190,
        250,
        70,
        22
      ],
      "id": "switch"
    },
    {
      "maxclass": "newobj",
      "text": "dac~",
      "patching_rect": [
        270,
        250,
        50,
        22
      ],
      "id": "dac"
    },
    {
      "maxclass": "newobj",
      "text": "message read \\$1",
      "patching_rect": [
        50,
        280,
        80,
        22
      ],
      "id": "msg_read"
    },
    {
      "maxclass": "newobj",
      "text": "f \\$1",
      "patching_rect": [
        140,
        280,
        40,
        22
      ],
      "id": "vol_float"
    },
    {
      "maxclass": "live.text",
      "text": "\ud83d\udc30",
      "patching_rect": [
        500,
        50,
        40,
        40
      ],
      "id": "status_text",
      "style": {
        "bgcolor": [
          248,
          242,
          255,
          255
        ],
        "textcolor": [
          93,
          93,
          129,
          255
        ],
        "bordercolor": [
          255,
          182,
          193,
          255
        ],
        "borderthickness": 2,
        "cornerradius": 5
      }
    },
    {
      "maxclass": "newobj",
      "text": "switch 2",
      "patching_rect": [
        450,
        80,
        50,
        22
      ],
      "id": "color_switch"
    },
    {
      "maxclass": "message",
      "text": "textcolor 100 200 100 255",
      "patching_rect": [
        450,
        110,
        140,
        22
      ],
      "id": "color_on",
      "style": {
        "bgcolor": [
          248,
          242,
          255,
          255
        ],
        "textcolor": [
          93,
          93,
          129,
          255
        ]
      }
    },
    {
      "maxclass": "message",
      "text": "textcolor 93 93 129 255",
      "patching_rect": [
        600,
        110,
        140,
        22
      ],
      "id": "color_off",
      "style": {
        "bgcolor": [
          248,
          242,
          255,
          255
        ],
        "textcolor": [
          93,
          93,
          129,
          255
        ]
      }
    },
    {
      "maxclass": "live.toggle",
      "text": "Enable Plugin",
      "patching_rect": [
        500,
        100,
        100,
        22
      ],
      "id": "enable_toggle",
      "parameter": "enable",
      "style": {
        "bgcolor": [
          248,
          242,
          255,
          255
        ],
        "activecolor": [
          255,
          182,
          193,
          255
        ],
        "bordercolor": [
          255,
          182,
          193,
          255
        ],
        "cornerradius": 5
      }
    },
    {
      "maxclass": "newobj",
      "text": "gate",
      "patching_rect": [
        200,
        200,
        40,
        22
      ],
      "id": "gate"
    },
    {
      "maxclass": "newobj",
      "text": "filepicker",
      "patching_rect": [
        50,
        350,
        100,
        22
      ],
      "id": "filepicker",
      "style": {
        "bgcolor": [
          248,
          242,
          255,
          255
        ],
        "activecolor": [
          255,
          182,
          193,
          255
        ],
        "bordercolor": [
          255,
          182,
          193,
          255
        ],
        "cornerradius": 5
      }
    },
    {
      "maxclass": "newobj",
      "text": "prepend set",
      "patching_rect": [
        260,
        350,
        80,
        22
      ],
      "id": "prepend_set"
    },
    {
      "maxclass": "live.button",
      "text": "\u25b6\ufe0f\ud83d\udc30 Preview",
      "patching_rect": [
        160,
        350,
        100,
        22
      ],
      "id": "test_button",
      "style": {
        "bgcolor": [
          248,
          242,
          255,
          255
        ],
        "activecolor": [
          255,
          182,
          193,
          255
        ],
        "bordercolor": [
          255,
          182,
          193,
          255
        ],
        "cornerradius": 5
      }
    },
    {
      "maxclass": "live.text",
      "text": "No sound selected",
      "patching_rect": [
        50,
        380,
        200,
        22
      ],
      "id": "filename_display",
      "style": {
        "bgcolor": [
          248,
          242,
          255,
          255
        ],
        "textcolor": [
          93,
          93,
          129,
          255
        ],
        "bordercolor": [
          255,
          182,
          193,
          255
        ],
        "cornerradius": 3
      }
    },
    {
      "maxclass": "live.slider",
      "text": "Volume",
      "patching_rect": [
        50,
        420,
        200,
        22
      ],
      "id": "volume_slider",
      "parameter": "volume",
      "range": [
        0,
        100
      ],
      "initial": 70,
      "style": {
        "bgcolor": [
          248,
          242,
          255,
          255
        ],
        "activecolor": [
          255,
          182,
          193,
          255
        ],
        "bordercolor": [
          255,
          182,
          193,
          255
        ],
        "cornerradius": 3
      }
    },
    {
      "maxclass": "live.toggle",
      "text": "\ud83d\udc2e Mute",
      "patching_rect": [
        50,
        450,
        80,
        22
      ],
      "id": "mute_toggle",
      "parameter": "mute",
      "style": {
        "bgcolor": [
          248,
          242,
          255,
          255
        ],
        "activecolor": [
          255,
          182,
          193,
          255
        ],
        "bordercolor": [
          255,
          182,
          193,
          255
        ],
        "cornerradius": 5
      }
    },
    {
      "maxclass": "newobj",
      "text": "scale 0 100 0. 1. @exponent 2",
      "patching_rect": [
        260,
        420,
        120,
        22
      ],
      "id": "scale"
    },
    {
      "maxclass": "newobj",
      "text": "pattr enable",
      "patching_rect": [
        650,
        100,
        60,
        22
      ],
      "id": "pattr_enable"
    },
    {
      "maxclass": "newobj",
      "text": "pattr volume",
      "patching_rect": [
        260,
        400,
        60,
        22
      ],
      "id": "pattr_volume"
    },
    {
      "maxclass": "newobj",
      "text": "pattr mute",
      "patching_rect": [
        130,
        450,
        60,
        22
      ],
      "id": "pattr_mute"
    },
    {
      "maxclass": "newobj",
      "text": "pattr filename",
      "patching_rect": [
        260,
        380,
        60,
        22
      ],
      "id": "pattr_filename"
    },
    {
      "maxclass": "newobj",
      "text": "pattrstorage",
      "patching_rect": [
        700,
        500,
        80,
        22
      ],
      "id": "pattrstorage",
      "parameter": "pattrstorage",
      "savestate": 1,
      "clientwindow": 0,
      "autopopulate": 1,
      "showeditor": 0
    }
  ],
  "lines": [
    {
      "patchline": {
        "source": [
          "observer",
          0
        ],
        "destination": [
          "sel",
          0
        ]
      }
    },
    {
      "patchline": {
        "source": [
          "sel",
          0
        ],
        "destination": [
          "trigger",
          0
        ]
      }
    },
    {
      "patchline": {
        "source": [
          "play",
          0
        ],
        "destination": [
          "gain",
          0
        ]
      }
    },
    {
      "patchline": {
        "source": [
          "gain",
          0
        ],
        "destination": [
          "switch",
          0
        ]
      }
    },
    {
      "patchline": {
        "source": [
          "switch",
          0
        ],
        "destination": [
          "dac",
          0
        ]
      }
    },
    {
      "patchline": {
        "source": [
          "switch",
          1
        ],
        "destination": [
          "dac",
          1
        ]
      }
    },
    {
      "patchline": {
        "source": [
          "vol_float",
          0
        ],
        "destination": [
          "gain",
          1
        ]
      }
    },
    {
      "patchline": {
        "source": [
          "msg_read",
          0
        ],
        "destination": [
          "play",
          0
        ]
      }
    },
    {
      "patchline": {
        "source": [
          "trigger",
          0
        ],
        "destination": [
          "gate",
          0
        ]
      }
    },
    {
      "patchline": {
        "source": [
          "gate",
          0
        ],
        "destination": [
          "play",
          0
        ]
      }
    },
    {
      "patchline": {
        "source": [
          "enable_toggle",
          0
        ],
        "destination": [
          "gate",
          1
        ]
      }
    },
    {
      "patchline": {
        "source": [
          "filepicker",
          0
        ],
        "destination": [
          "msg_read",
          0
        ]
      }
    },
    {
      "patchline": {
        "source": [
          "test_button",
          0
        ],
        "destination": [
          "play",
          0
        ]
      }
    },
    {
      "patchline": {
        "source": [
          "filepicker",
          0
        ],
        "destination": [
          "prepend_set",
          0
        ]
      }
    },
    {
      "patchline": {
        "source": [
          "prepend_set",
          0
        ],
        "destination": [
          "filename_display",
          0
        ]
      }
    },
    {
      "patchline": {
        "source": [
          "volume_slider",
          0
        ],
        "destination": [
          "scale",
          0
        ]
      }
    },
    {
      "patchline": {
        "source": [
          "scale",
          0
        ],
        "destination": [
          "vol_float",
          0
        ]
      }
    },
    {
      "patchline": {
        "source": [
          "mute_toggle",
          0
        ],
        "destination": [
          "switch",
          1
        ]
      }
    },
    {
      "patchline": {
        "source": [
          "pattr_enable",
          0
        ],
        "destination": [
          "enable_toggle",
          1
        ]
      }
    },
    {
      "patchline": {
        "source": [
          "pattr_volume",
          0
        ],
        "destination": [
          "volume_slider",
          1
        ]
      }
    },
    {
      "patchline": {
        "source": [
          "pattr_mute",
          0
        ],
        "destination": [
          "mute_toggle",
          1
        ]
      }
    },
    {
      "patchline": {
        "source": [
          "pattr_filename",
          0
        ],
        "destination": [
          "filename_display",
          1
        ]
      }
    },
    {
      "patchline": {
        "source": [
          "observer",
          0
        ],
        "destination": [
          "color_switch",
          0
        ]
      }
    },
    {
      "patchline": {
        "source": [
          "color_switch",
          0
        ],
        "destination": [
          "color_on",
          0
        ]
      }
    },
    {
      "patchline": {
        "source": [
          "color_switch",
          1
        ],
        "destination": [
          "color_off",
          0
        ]
      }
    },
    {
      "patchline": {
        "source": [
          "color_on",
          0
        ],
        "destination": [
          "status_text",
          0
        ]
      }
    },
    {
      "patchline": {
        "source": [
          "color_off",
          0
        ],
        "destination": [
          "status_text",
          0
        ]
      }
    },
    {
      "patchline": {
        "source": [
          "pattr_filename",
          0
        ],
        "destination": [
          "msg_read",
          0
        ]
      }
    }
  ],
  "dependency_cache": [],
  "patcher": {
    "fileversion": 1,
    "appversion": "8.6.0",
    "rect": [
      0,
      0,
      800,
      600
    ],
    "bglocked": false,
    "openinpresentation": true,
    "default_fontsize": 12,
    "default_fontface": 0,
    "default_fontname": "Arial",
    "gridsize": [
      15,
      15
    ],
    "gridsnap": true
  }
}