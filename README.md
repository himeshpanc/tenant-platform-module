# tenant-platform-module

A versioned platform module. Each **semver git tag** is a platform release that the
Kargo fleet pipeline promotes progressively across tenant environments
(tenant-a → tenant-b/tenant-c), with per-tenant verification and PR gates.
