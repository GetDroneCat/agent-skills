---
description: Run the pre-launch checklist and prepare for production deployment
---

Use skill: `shipping-and-launch`.

Run complete pre-launch checklist:

1. Code quality — tests/build/lint clean, no debug leftovers
2. Security — audit clean, no secrets, auth checks, headers
3. Performance — vitals/queries/images/bundle health
4. Accessibility — keyboard nav, screen-reader compatibility, contrast
5. Infrastructure — env vars, migrations, monitoring
6. Documentation — README/ADRs/changelog current

Report failing checks and fix before deploy.
Define rollback plan before proceeding.
