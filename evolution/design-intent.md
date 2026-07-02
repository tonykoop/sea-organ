# Design Intent — sea-organ rev A

- Master CAD: none exists (see `evolution/master/manifest.json` — honest no-scad intake). Design source: `design.md` (sha256: 5b48f47ac3b5bc283874fefc0ec2770b3a3114b9973efcf71ab4854918e38fb7).
- Function: A sea organ concept — a seawall/shoreline installation where tide and wave motion drives air through tuned pipe or whistle-like chambers, producing a site-responsive (not keyboard-controlled) sound field. This packet owns mechanism-family framing only; it does not specify pipe count, bore, chamber volume, pressure/flow, or tuning (all `pending_measurement`, see design.md "Pending Parameters").
- Environment: public shoreline installation; wave/tide-driven air, saltwater exposure, public access. Marine/civil structural engineering is a separate authority chain from instrument design (decision-record.md).
- Target qty: 1 (concept study, not a prototype build). Deadline: TBD. Budget/unit ceiling: TBD.

## Critical dimensions (carry tolerances)

| Feature | Nominal | Tolerance | Why critical | Source |
| --- | --- | --- | --- | --- |
| Site tide range | TBD | — | drives air-capture sizing | design.md `pending_site_tide_range` |
| Wave energy profile | TBD | — | drives air-capture mechanism choice | design.md `pending_wave_energy_profile` |
| Air-capture chamber volume | TBD | — | drives pipe/whistle air supply | design.md `pending_chamber_volume` |
| Pipe count / pitch policy | TBD | — | drives tuning and voicing | design.md `pending_pipe_count`, `pending_pipe_scale_or_pitch_policy` |
| Drainage strategy | TBD | — | prevents chamber flooding/fouling | design.md `pending_drainage_strategy` |
| Corrosion strategy | TBD | — | material survival in saltwater | design.md `pending_saltwater_corrosion_strategy` |

All rows above are explicitly unresolved named unknowns in `design.md`; none may be filled without measured site data or named expert review (`decision-record.md` Promotion Gates).

## Incidental (free for DFM)

- Aesthetic treatment of any future above-water enclosure or signage, once a structural/marine design exists.

## Must-nots (DFM may never violate)

- Do not specify pipe dimensions, tuning values, chamber volumes, pressure values, tide ranges, wave loads, seawall details, CAD geometry, or DXF coordinates without measured site data (README.md, design.md Authority Boundary).
- Do not treat seawall/shoreline integration as instrument-maker-generated structure — marine/civil engineering review required first (decision-record.md).
- Do not skip the airflow-coupon / site-study L1->L2 gate before any pipe layout or CAD work (decision-record.md Promotion Gates; risks.md).
- Do not select materials before the saltwater corrosion/galvanic review (risks.md).

## Material intent

- Not yet selected. `bom.csv` records subsystem families only (marine site interface, wave/air capture chamber, ducts/manifold/drainage, pipes/resonators, marine-grade fasteners and corrosion controls) — all `pending_measurement` or `concept_only`.
- Forbidden: none recorded.

## Stage status

Stage 0 intake complete 2026-07-01. No CAD master exists (honest no-scad — architectural/environmental instrument, geometry not yet defined). Gate A (Alpha shop compile) NOT yet run — no concessions logged, nothing presented as shippable.
