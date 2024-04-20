class JsonString {
  static String nestedJson = ('''
[
  {
    "key": "widget1",
    "widgetLayout": {
      "dx": 0.25,
      "dy": 0.25,
      "height": 200.0,
      "width": 200.0,
      "padding": {}
    },
    "widgetStyle": {
      "color": {
        "r": 255,
        "g": 0,
        "b": 0,
        "opacity": 1
      },
      "corner": {},
      "shadows": []
    },
    "children": [
      {
        "key": "widget2",
        "widgetLayout": {
          "dx": 0.1,
          "dy": 0.1,
          "height": 60.0,
          "width": 60.0,
          "padding": {}
        },
        "widgetStyle": {
          "color": {
            "r": 0,
            "g": 255,
            "b": 0,
            "opacity": 1
          },
          "corner": {},
          "shadows": []
        }
      }
    ]
  },
  {
    "key": "widget3",
    "widgetLayout": {
      "dx": 0.6,
      "dy": 0.6,
      "height": 150.0,
      "width": 150.0,
      "padding": {}
    },
    "widgetStyle": {
      "color": {
        "r": 255,
        "g": 0,
        "b": 255,
        "opacity": 1
      },
      "corner": {},
      "shadows": []
    },
    "children": [
      {
        "key": "widget4",
        "widgetLayout": {
          "dx": 0.2,
          "dy": 0.2,
          "height": 20.0,
          "width": 20.0,
          "padding": {}
        },
        "widgetStyle": {
          "color": {
            "r": 0,
            "g": 255,
            "b": 255,
            "opacity": 1
          },
          "corner": {},
          "shadows": []
        }
      }
    ]
  }
]


''');
}
