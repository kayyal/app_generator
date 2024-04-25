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

  static String nestedJson2 = '''
[
  {
    "key": "widget1",
    "widgetLayout": {
      "dx": 0.25,
      "dy": 0.25,
      "height": 200.0,
      "width": 200.0,
      "isAbsolutePosition": false,
      "isAbsoluteSize": false,
      "padding": {}
    },
    "widgetStyle": {
      "color": {
        "r": 255,
        "g": 0,
        "b": 0,
        "opacity": 1
      },
      "corner": {
        "topRight": 20.0,
        "topLeft": 20.0,
        "bottomRight": 0.0,
        "bottomLeft": 0.0
      },
      "shadows": [
        {
          "color": {
            "r": 0,
            "g": 0,
            "b": 0,
            "opacity": 0.5
          },
          "offsetX": 2.0,
          "offsetY":2.0,
          "blurStyle":3,
          "blurRadius": 10.0,
          "spreadRadius": 2.0
        }
      ]
    },
    "children": [
      {
        "key": "widget2",
        "widgetLayout": {
          "dx": 0.1,
          "dy": 0.1,
          "height": 60.0,
          "width": 60.0,
          "isAbsolutePosition": false,
          "isAbsoluteSize": false,
          "padding": {}
        },
        "widgetStyle": {
          "color": {
            "r": 0,
            "g": 255,
            "b": 0,
            "opacity": 1
          },
          "corner": {
            "topRight": 10.0,
            "topLeft": 10.0,
            "bottomRight": 0.0,
            "bottomLeft": 0.0
          },
          "shadows": []
        }
      },
      {
        "key": "widget3",
        "widgetLayout": {
          "dx": 50.0,
          "dy": 50.0,
          "height": 50.0,
          "width": 50.0,
          "isAbsolutePosition": true,
          "isAbsoluteSize": true,
          "padding": {}
        },
        "widgetStyle": {
          "color": {
            "r": 0,
            "g": 0,
            "b": 255,
            "opacity": 1
          },
          "corner": {
            "topRight": 0.0,
            "topLeft": 0.0,
            "bottomRight": 0.0,
            "bottomLeft": 0.0
          },
          "shadows": [
            {
              "color": {
                "r": 255,
                "g": 255,
                "b": 0,
                "opacity": 0.3
              },
              "offsetX": 2.0,
              "offsetY":2.0,
              "blurStyle":3,
              "blurRadius": 5.0,
              "spreadRadius": 1.0
            }
          ]
        }
      }
    ]
  },
  {
    "key": "widget4",
    "widgetLayout": {
      "dx": 0.6,
      "dy": 0.6,
      "height": 150.0,
      "width": 150.0,
      "isAbsolutePosition": false,
      "isAbsoluteSize": true,
      "padding": {}
    },
    "widgetStyle": {
      "color": {
        "r": 255,
        "g": 0,
        "b": 255,
        "opacity": 1
      },
      "corner": {
        "topRight": 15.0,
        "topLeft": 15.0,
        "bottomRight": 0.0,
        "bottomLeft": 0.0
      },
      "shadows": []
    },
    "children": [
      {
        "key": "widget5",
        "widgetLayout": {
          "dx": 0.2,
          "dy": 0.2,
          "height": 20.0,
          "width": 20.0,
          "isAbsolutePosition": false,
          "isAbsoluteSize": false,
          "padding": {}
        },
        "widgetStyle": {
          "color": {
            "r": 255,
            "g": 255,
            "b": 0,
            "opacity": 1
          },
          "corner": {
            "topRight": 0.0,
            "topLeft": 0.0,
            "bottomRight": 0.0,
            "bottomLeft": 0.0
          },
          "shadows": [
            {
              "color": {
                "r": 0,
                "g": 255,
                "b": 255,
                "opacity": 0.2
              },
              "offsetX": 2.0,
              "offsetY":2.0,
              "blurStyle":3,
              "blurRadius": 3.0,
              "spreadRadius": 0.5
            }
          ]
        }
      },
      {
        "key": "widget6",
        "widgetLayout": {
          "dx": 80.0,
          "dy": 80.0,
          "height": 30.0,
          "width": 30.0,
          "isAbsolutePosition": true,
          "isAbsoluteSize": false,
          "padding": {}
        },
        "widgetStyle": {
          "color": {
            "r": 0,
            "g": 255,
            "b": 255,
            "opacity": 1
          },
          "corner": {
            "topRight": 0.0,
            "topLeft": 0.0,
            "bottomRight": 0.0,
            "bottomLeft": 0.0
          },
          "shadows": []
        }
      }
    ]
  }
]

''';

  static String nestedJson3 = '''
  [
  {
    "key": "widget1",
    "widgetLayout": {
      "dx": 0.25,
      "dy": 0.25,
      "height": 200.0,
      "width": 200.0,
      "isAbsolutePosition": false,
      "isAbsoluteSize": false,
      "padding": {}
    },
    "widgetStyle": {
      "color": {
        "r": 255,
        "g": 0,
        "b": 0,
        "opacity": 1
      },
      "corner": {
        "topRight": 20.0,
        "topLeft": 20.0,
        "bottomRight": 0.0,
        "bottomLeft": 0.0
      },
      "shadows": [
        {
          "color": {
            "r": 0,
            "g": 0,
            "b": 0,
            "opacity": 0.5
          },
          "offsetX": 2.0,
          "offsetY":2.0,
          "blurStyle":3,
          "blurRadius": 10.0,
          "spreadRadius": 2.0
        }
      ]
    },
    "textInfo": {
      "content": {
        "text": "Hello"
      },
      "style": {
        "color": {
          "r": 0,
          "g": 0,
          "b": 255
        },
        "size": 16.0,
        "weight": 400,
        "underline": false
      }
    },
    "children": [
      {
        "key": "widget2",
        "widgetLayout": {
          "dx": 0.1,
          "dy": 0.1,
          "height": 60.0,
          "width": 60.0,
          "isAbsolutePosition": false,
          "isAbsoluteSize": false,
          "padding": {}
        },
        "widgetStyle": {
          "color": {
            "r": 0,
            "g": 255,
            "b": 0,
            "opacity": 1
          },
          "corner": {
            "topRight": 10.0,
            "topLeft": 10.0,
            "bottomRight": 0.0,
            "bottomLeft": 0.0
          },
          "shadows": []
        },
        "textInfo": {
          "content": {
            "text": "World"
          },
          "style": {
            "color": {
              "r": 255,
              "g": 0,
              "b": 255
            },
            "size": 14.0,
            "weight": 700,
            "underline": true
          }
        }
      }
    ]
  }
]

  
  ''';

  static String nestedJson4 = '''
  
[
  {
    "key": "widget1",
    "widgetLayout": {
      "dx": 0.25,
      "dy": 0.25,
      "height": 200.0,
      "width": 200.0,
      "isAbsolutePosition": false,
      "isAbsoluteSize": false,
      "padding": {}
    },
    "widgetStyle": {
      "color": {
        "r": 255,
        "g": 0,
        "b": 0,
        "opacity": 1
      },
      "corner": {
        "topRight": 20.0,
        "topLeft": 20.0,
        "bottomRight": 0.0,
        "bottomLeft": 0.0
      },
      "shadows": []
    },
    "textInfo": {
      "content": {
        "text": "Hello"
      },
      "style": {
        "color": {
          "r": 0,
          "g": 0,
          "b": 255
        },
        "size": 16.0,
        "weight": 400,
        "underline": false
      }
    },
    "alignedWithParent": {
      "x": 0.0,
      "y": 1.0
    },
    "children": [
      {
        "key": "widget2",
        "widgetLayout": {
          "dx": 0.1,
          "dy": 0.1,
          "height": 60.0,
          "width": 60.0,
          "isAbsolutePosition": false,
          "isAbsoluteSize": false,
          "padding": {}
        },
        "widgetStyle": {
          "color": {
            "r": 0,
            "g": 255,
            "b": 0,
            "opacity": 1
          },
          "corner": {
            "topRight": 10.0,
            "topLeft": 10.0,
            "bottomRight": 0.0,
            "bottomLeft": 0.0
          },
          "shadows": []
        },
        "textInfo": {
          "content": {
            "text": "World"
          },
          "style": {
            "color": {
              "r": 255,
              "g": 0,
              "b": 255
            },
            "size": 14.0,
            "weight": 700,
            "underline": true
          }
        }
      }
    ]
  },
  {
    "key": "widget3",
    "widgetLayout": {
      "dx": 0.5,
      "dy": 0.5,
      "height": 100.0,
      "width": 100.0,
      "isAbsolutePosition": false,
      "isAbsoluteSize": false,
      "padding": {}
    },
    "widgetStyle": {
      "color": {
        "r": 0,
        "g": 0,
        "b": 255,
        "opacity": 1
      },
      "corner": {
        "topRight": 0.0,
        "topLeft": 0.0,
        "bottomRight": 20.0,
        "bottomLeft": 20.0
      },
      "shadows": []
    },
    "textInfo": {
      "content": {
        "text": "Flutter"
      },
      "style": {
        "color": {
          "r": 255,
          "g": 255,
          "b": 0
        },
        "size": 18.0,
        "weight": 600,
        "underline": false
      }
    },
    "alignedWithParent": {
      "x": 0,
      "y": -1.0
    }
  }
]


  
  ''';
}
