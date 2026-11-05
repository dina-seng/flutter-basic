# Flutter Exam – Layout Exercise

## Goal
Build the layout below with Flutter widgets.
Write your code only where you see `// YOUR CODE` in the start code.

## Situation
You are building the skeleton of a **music player**: a navigation rail on the left, the album cover area, and the player controls under it.
All the elements are simple colored boxes: no text, no icons.

## Layout

```
|<-60->|<------------ remaining width ------------->|
+------+--------------------------------------------+  ^
|INDIGO|                                            |  |
|  40  |                                            |  |
+------+                                            |  |
| PINK |                                            |  |
|  80  |             CYAN (2/3 height)              |  |
+------+                                            |  |
|      |                                            |  |
|INDIGO|                                            |  full
|      |                                            |  height
|      |                                            |  |
|      +--------------------------------------------+  |
|      |               15 (grey gap)                |  |
|      +--------------------------------------------+  |
|      |          DEEP PURPLE (1/3 height)          |  |
|      |                                            |  |
+------+  +-----+    +-----+    +-----+    +-----+  |  |
| PINK |  |WHITE| 50 |WHITE|    |WHITE|    |WHITE|  |  |
|  80  |  +-----+    +-----+    +-----+    +-----+  |  |
+------+    50                                      |  |
|INDIGO|                                            |  |
|  40  |                                            |  |
+------+--------------------------------------------+  v
```

Note: there is **no** gap between the rail and the area on its right.

## Expected rendering

![Expected rendering](rendering.png)

Example on a 412 x 750 screen.

![Expected rendering on a wider screen](rendering_extended.png)

Same view on a wider screen (824 x 750). The fixed sizes stay the same on any screen; the flexible areas adapt.

## Rules
- The root widget of `body` must be a `Row` (already in the start code)
- Do **not** use fixed heights for cyan and deep purple: the layout must adapt to any screen size
- Do not change the code outside `// YOUR CODE`

## Start code

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[300],
        body:
            // YOUR CODE
            Row(),
      ),
    ),
  );
}
```
