# PoseFixeR 0.2.1

## Documentation

* `?PoseFixeR` now answers: a package help page gives one paragraph on what the
  package is for, the main entry points grouped by task, and where to go next.
* A vignette carries one task end to end on synthetic or bundled data, offline,
  and is built and run by `R CMD check`.
* Runnable `@examples` added or corrected across 11 help pages. Each runs
  offline in seconds, writes nothing outside `tempdir()`, and is executed by
  `R CMD check`; anything needing a device, a download or an optional backend is
  fenced with the reason stated.
* The README's quick start runs as written: it attaches the package, builds its
  own inputs, and uses only hard dependencies.

# PoseFixeR 0.2.0

- Release into the x-biosignal biosignal-analysis ecosystem.
- Documentation completed for all exported functions; example OpenPose JSON
  moved to `inst/extdata`; unused dependencies trimmed; code made ASCII-portable.
- Method and original software by Sugiyama, Uno and Matsui (2023,
  PLOS Comput Biol 19:e1009989).

# PoseFixeR 0.1.0

- Initial release accompanying Sugiyama, Uno and Matsui (2023).
