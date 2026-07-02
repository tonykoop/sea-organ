<!-- SPDX-License-Identifier: CC-BY-4.0 -->

# Risks

This is an L1 concept packet (see `README.md`, `design.md`). No site, marine
structure, pipe, or acoustic design exists yet, so risks below are scoped to
what would matter once a site-study and airflow-coupon evidence path opens
(`decision-record.md` Promotion Gates), not to a specific build.

## Highest Risks

### Marine/Structural Authority

A seawall or shoreline interface is civil/marine engineering work, not
instrument-maker-generated structure. Any air-capture chamber that also acts as
a load-bearing or wave-impact surface must be reviewed by a qualified marine
or structural engineer before fabrication.

Mitigation: keep pipe/instrument design and marine-structure design as
separate authority chains; do not let this packet imply structural competence.

### Saltwater Corrosion and Galvanic Compatibility

Any metal air-path, pipe, or fastener exposed to salt spray, tidal wetting, or
brackish air will corrode or gall if materials are chosen without a marine
corrosion/galvanic review.

Mitigation: defer material selection until `pending_saltwater_corrosion_strategy`
(design.md) is resolved with a named reviewer.

### Public Safety and Access

A shoreline sound installation is a public-space structure: trip/fall hazards,
pinch points, wave-overtopping risk to bystanders, and maintenance access all
need review before any public installation.

Mitigation: keep `pending_public_safety_boundary` (design.md) open until a
site review and access plan exist; no public installation is implied by this
packet.

### Wildlife and Environmental Impact

Tidal/shoreline installations can affect intertidal habitat, drainage, and
local wildlife.

Mitigation: treat environmental review as a promotion gate alongside marine
structural and public-safety review, not an afterthought.

## Readiness Risks

- No measured site (tide/wave) data exists.
- No air-capture, duct, pipe, or chamber geometry exists.
- No airflow coupon test has been run.
- No marine/structural or public-safety review has occurred.

## Public Claims Boundary

This repo can claim an L1 concept packet only. It must not claim
site-ready, structurally reviewed, tuned, measured, public-installable, or
build-ready status until the L1 -> L2 -> L3 gates in `decision-record.md`
close.
