<!-- SPDX-License-Identifier: CC-BY-4.0 -->

# MCP Session Log

No MCP, CAD, image-generation, drawing, Wolfram, measurement, acoustic
simulation, marine engineering, or creative-tool session was run for this L1
packet. The packet was authored as text and CSV only.

## Step 0 QMD

Command run from `/mnt/c/Users/Tony/Documents/GitHub`:

```text
qmd search "sea organ wave-driven pipe organ seawall" -c instrument-builds
```

Observed result: qmd failed before returning context because the sqlite-vec
extension was unavailable and the database file could not be opened.

## Tool Sessions

| session_id | tool | input_authority | outputs | role | authority_result | review_status | notes |
| --- | --- | --- | --- | --- | --- | --- | --- |
| 2026-05-30-sea-organ-l1 | qmd CLI; local file authoring | User prompt; QMD Step 0 attempt | `README.md`; `design.md`; `bom.csv`; `visual-output-register.csv`; `cad/mcp-session-log.md`; `decision-record.md` | l1_packet_scaffold | concept_only / pending_measurement | self_checked | QMD failed with sqlite-vec unavailable. No pipe dimensions, tuning values, pressure data, wave loads, CAD geometry, DXF coordinates, or measured validation data were generated. |
| 2026-05-30-sea-organ-wolfram | local file authoring only | L1 packet text; no measured site, pipe, marine, or acoustic inputs | `sea-organ-starter.wl`; `wolfram/sea-organ-wolfram-model.wl`; `visual-output-register.csv`; `cad/mcp-session-log.md` | wolfram_reference_model | reference_only | self_checked | Wolfram source authored by hand. No MCP, Wolfram Desktop, Wolfram Cloud, CAD, CAM, marine simulation, or acoustic simulation session was run; source is not fabrication authority. |
| fable-v5-refresh-2026-07-01 | claude-code (Fable 5) | design.md, bom.csv, decision-record.md | sourcing.csv, cut-list.csv, validation.csv, risks.md, drawing-brief.md | packet_refresh | concept_only / pending_measurement | self_checked | V5 refresh pass: scaffolded five missing baseline files honestly (TBD/pending_measurement), mirroring design.md's named pending_* parameters and bom.csv subsystem families. No CAD, scad, DXF, site measurement, or acoustic model was created — remains an honest L1 concept packet; SEA-CAD-PLAN-001/SEA-DXF-PLAN-001 stay planned-only. Evolution/ Stage 0 intake added (design table = design.md; no CAD master exists to include). |

## Next Provenance Requirement

Any future CAD, drawing, site measurement, tide/wave record, acoustic model,
pipe tuning, pressure/flow estimate, marine engineering review, render, or
fabrication artifact must add a new row here with the real tool, source inputs,
outputs, review status, and authority result.
