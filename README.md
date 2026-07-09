# tenant-platform-module

Minimal **version trigger** for the **fleet** demo (Kargo + Flux progressive delivery).

This repo holds no real logic — each **semver git tag** is a "platform version" that
Kargo promotes across the tenant fleet: **tenant-a (canary) → tenant-b + tenant-c
(prod)**, with per-tenant verification, a soak window, and a PR gate on prod.

The actual work each promotion runs lives in
[`gitops-tenants/fleet/tenants/<tenant>`](https://github.com/himeshpanc/gitops-tenants):
tofu writes a config bundle to OpenBao, then Flux applies the tenant's `podinfo` app +
its cert-manager Certificate + nginx Ingress. The tag here is just the input.

> The fleet keeps tofu **state in git**, so a version bump plans a **destroy/replace** —
> shown in each prod PR for review before merge.

## How it's used
- Kargo's `tenant-platform` Warehouse watches this repo's **SemVer tags** → Freight.
- Tagging a new version **kicks off a fleet rollout** (canary first, then prod via PR).
- The tag's **minor version** also drives the replica count (1.2.0 → 2 pods, 1.3.0 → 3, …),
  so a bump visibly rescales the fleet.

> ⚠️ Demo / workshop repo — generic content only; the tag is what matters, not the code.
> Analogous to [`tf-podinfo-module`](https://github.com/himeshpanc/tf-podinfo-module),
> which triggers the infra demo.
