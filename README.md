# Music Theory Library for Swift

[![Build](https://github.com/fwcd/swift-music-theory/actions/workflows/build.yml/badge.svg)](https://github.com/fwcd/swift-music-theory/actions/workflows/build.yml)

A minimal library for Western music theory in pure Swift, defining notes, scales, chords, intervals, progressions and more.

Since no external dependencies are needed, it runs on Linux, macOS and any other platform supporting Swift 5.2+.

## Examples
```swift
// Creating (octaved) notes
Note(.c, 3)             // -> C3
Note(.d.flat, 2)        // -> Db2

// Applying diatonic intervals
Note(.c, 3) + .majorThird // -> E3
Note(.d, 2) + .octave     // -> D3

// Applying chromatic intervals
Note(.f, 2) + .semitone
Note(.g.sharp, 0) + .semitones(3)

// Creating scales
DiatonicMajorScale(key: Note(.e, 2)).notes // -> [E2, F#2, G#2, A2, B2, C#3, D#3]
DiatonicMinorScale(key: Note(.c, 1)).notes // -> [C1, D1, Eb1, F1, G1, Ab1, Bb1]
BluesScale(key: Note(.g, 0)).notes         // -> [G0, Bb0, C1, Db1, D1, F1]
```

To experiment with the library yourself, simply run `swift run --repl` to open an interactive shell and enter

```swift
import MusicTheory
```
