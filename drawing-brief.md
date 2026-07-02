<!-- SPDX-License-Identifier: CC-BY-4.0 -->

# Sea Organ Drawing Brief

This is an L1 concept packet (see `README.md`). No CAD, DXF, or dimensioned
drawing exists, and none is implied here. `visual-output-register.csv` already
records `cad/sea-organ.scad` and `drawings/sea-organ-layout.dxf` as
`planned_missing_artifact` — future artifacts only, not present.

## Required future drawings (TBD, gated on site-study evidence)

- Site/context plan: shoreline geometry, tide range, and wave-exposure zone
  (requires measured site data — `pending_site_tide_range`, design.md).
- Air-capture chamber section (requires `pending_air_capture_geometry`,
  design.md).
- Duct/manifold/drainage routing plan (requires `pending_drainage_strategy`,
  design.md).
- Pipe/whistle voice layout and tuning table (requires
  `pending_pipe_count` and `pending_pipe_scale_or_pitch_policy`, design.md).

## Authority Notes

- No drawing in this list may be produced before the corresponding
  `pending_*` parameter in `design.md` is resolved with measured site data or
  named expert review.
- Any future CAD/DXF work must add a provenance row to
  `cad/mcp-session-log.md` and a register row to `visual-output-register.csv`
  before being treated as anything beyond `pending_measurement`.
