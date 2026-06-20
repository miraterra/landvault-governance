# ADR Triage: Corpus / Shell-Local / Retire

**Source data**: `landvault-management/meta/adr/LOG.yaml` (ADR-0001..0054 + DRAFT-ADR-0053)
**Boundary rule applied**: CONSTITUTION.md Section 5 (ratified 2026-06-10)
**Triage date**: 2026-06-10
**Issue**: LVGOV-2026-0003

---

## Boundary Rule Summary

**CORPUS** — applies when either:
- Condition A: Binds two or more `landvault-*` repositories.
- Condition B: Defines, names, or constrains a contract between two or more
  repositories — an event type, an API shape, a shared data structure, a
  capability protocol — regardless of how many repositories are currently
  implementing it.

**SHELL-LOCAL** — applies when all of the following hold:
- Governs a concern entirely internal to one repository.
- No other repository's behaviour depends on or is constrained by the decision.
- Does not define a shared term, event type, or interface in any inter-repo contract.

**RETIRE** — obsolete, fully superseded, or not present in the log.

---

## Triage Table

| ADR ID | Title | Disposition | Cluster | Rationale |
|--------|-------|-------------|---------|-----------|
| ADR-0001 | Pod components are Web Components, not Module Federation or in-process React | CORPUS | — | Defines the custom-element interface contract between shell and pod repos; Condition B — any pod repo at stage 3 must implement this protocol. |
| ADR-0002 | Pods ship in three stages; the contract is written for stage 3 from day one | CORPUS | — | Constrains the stage-3 independence contract that governs how all pod repos evolve; Condition A/B — binds pod repos to the no-shell-import, no-shared-context rule from day one. |
| ADR-0003 | Pod web components render in Light DOM; Shadow DOM is forbidden | SHELL-LOCAL | Design-system | landvault-shell is the only host for pods; other UIs do not use this pattern. The Light DOM rule is a shell-internal architectural constraint, not a platform-wide cross-repo obligation. ADR-0012 (CORPUS) depends on it, so it is retained in the cluster for ordering reference. |
| ADR-0004 | Pod auth contract carries four properties; entry gated on claims spec | CORPUS | Connection-layer | Defines the four-property auth contract between shell and every pod repo; Condition B — canonical inter-repo interface. |
| ADR-0005 | ShellBus is the single typed communication channel between the shell and pods | CORPUS | — | Defines the bus as the sole shell↔pod communication protocol; Condition B — names and constrains the inter-repo event channel. |
| ADR-0006 | Pod ↔ Gabe communication uses gabe:prompt / gabe:message bus events with requestId correlation | CORPUS | Gabe | Defines named bus events (gabe:prompt, gabe:message) and the requestId correlation protocol; Condition B — pod repos must conform to these event shapes. |
| ADR-0007 | Shell registry owns pod metadata and access predicates; pods self-register via import | CORPUS | — | Defines the pod self-registration protocol (registry entry + main.tsx import); Condition B — constrains how pod repos integrate into the shell. |
| ADR-0008 | Dashboard widget composition is shell-owned; pods declare widgets via registration metadata | SHELL-LOCAL | — | landvault-shell is the only host for pods. Widget composition is a shell-internal concern; the widget field in PodRegistration is a shell-specific convention, not a platform-wide inter-repo contract. |
| ADR-0009 | toast:show ShellBus event is the only channel for pod transient notifications | CORPUS | — | Names the toast:show event that pod repos must emit; Condition B — constrains the notification inter-repo contract. |
| ADR-0010 | Pod context is merged into the user turn; no preceding separate context message | SHELL-LOCAL | Gabe | Governs how the shell internally processes the context block from a gabe:prompt event; the event contract is ADR-0006; this is the shell's handling implementation — no other repo depends on this decision. |
| ADR-0011 | Silent Gabe calls use a separate isSilentStreamingRef; they do not share isStreaming state | SHELL-LOCAL | Gabe | Internal hook implementation detail (isSilentStreamingRef vs isStreaming) within useGabeChat; no pod repo depends on the specific concurrency guard mechanism. |
| ADR-0012 | All reusable UI components live in the component library; pods and pages consume, never redefine | CORPUS | Design-system | Binds pod repos to consume the library and not redefine primitives; Condition A — applies to all landvault-* pod repos. Also constrains the one-way DAG dependency direction (no pod→pod imports), which is an inter-repo structural rule. |
| ADR-0013 | Shell sidebar has contracted (icons) and expanded (icons + labels) modes; both show the same pod set | SHELL-LOCAL | — | Internal shell layout/navigation UX decision; no pod repo's behaviour depends on sidebar display mode. |
| ADR-0014 | Pod MVP visibility is registry-declared via navVisible; nav and dashboard widgets follow the same flag | CORPUS | — | Extends the pod registration contract with the navVisible field; Condition B — pod maintainers must understand and set this field in the inter-repo registry protocol. |
| ADR-0015 | Pod data access calls Supabase REST directly in stage 1; an API layer replaces this in stage 2 | CORPUS | Connection-layer | Defines the inter-repo data access pattern for pod repos (direct Supabase now, platform API later); Condition A/B — constrains pod repos' backend access approach and bans the Supabase SDK. |
| ADR-0016 | Shell variant is controlled by a build-time AppConfig; each app declares its pods, Gabe persona, and theme | SHELL-LOCAL | — | Internal shell build configuration; AppConfig is selected via VITE_APP_ID and governs only shell internals; no pod repo's behaviour depends on this mechanism. |
| ADR-0017 | CORS allowed-origins are explicit per tier; wildcards forbidden in production | CORPUS | Connection-layer | Explicitly binds every backend the shell calls; Condition A — a multi-repo security rule requiring each backend repo to declare explicit CORS allowed-origins. |
| ADR-0018 | MCP tool registry: mcp:register on mount, gabe:tool:call / gabe:tool:result round-trip, namespaced tool names | CORPUS | Gabe | Defines named bus events (mcp:register, gabe:tool:call, gabe:tool:result), the tool registration protocol, and namespacing convention; Condition B — pod repos that expose Gabe tools must conform to this inter-repo contract. |
| ADR-0019 | *(not present in LOG.yaml)* | RETIRE | — | Not authored; absent from the ADR log — no text to migrate. |
| ADR-0020 | *(not present in LOG.yaml)* | RETIRE | — | Not authored; absent from the ADR log — no text to migrate. |
| ADR-0021 | *(not present in LOG.yaml)* | RETIRE | — | Not authored; absent from the ADR log — no text to migrate. |
| ADR-0022 | *(not present in LOG.yaml)* | RETIRE | — | Not authored; absent from the ADR log — no text to migrate. |
| ADR-0023 | *(not present in LOG.yaml)* | RETIRE | — | Not authored; absent from the ADR log — no text to migrate. |
| ADR-0024 | *(not present in LOG.yaml)* | RETIRE | — | Not authored; absent from the ADR log — no text to migrate. |
| ADR-0025 | *(not present in LOG.yaml)* | RETIRE | — | Not authored; absent from the ADR log — no text to migrate. |
| ADR-0026 | *(not present in LOG.yaml)* | RETIRE | — | Not authored; absent from the ADR log — no text to migrate. |
| ADR-0027 | *(not present in LOG.yaml)* | RETIRE | — | Not authored; absent from the ADR log — no text to migrate. |
| ADR-0028 | *(not present in LOG.yaml)* | RETIRE | — | Not authored; absent from the ADR log — no text to migrate. |
| ADR-0029 | *(not present in LOG.yaml)* | RETIRE | — | Not authored; absent from the ADR log — no text to migrate. |
| ADR-0030 | *(not present in LOG.yaml)* | RETIRE | — | Not authored; absent from the ADR log — no text to migrate. |
| ADR-0031 | *(not present in LOG.yaml)* | RETIRE | — | Not authored; absent from the ADR log — no text to migrate. |
| ADR-0032 | *(not present in LOG.yaml)* | RETIRE | — | Not authored; absent from the ADR log — no text to migrate. |
| ADR-0033 | *(not present in LOG.yaml)* | RETIRE | — | Not authored; absent from the ADR log — no text to migrate. |
| ADR-0034 | *(not present in LOG.yaml)* | RETIRE | — | Not authored; absent from the ADR log — no text to migrate. |
| ADR-0035 | *(not present in LOG.yaml)* | RETIRE | — | Not authored; absent from the ADR log — no text to migrate. |
| ADR-0036 | *(not present in LOG.yaml)* | RETIRE | — | Not authored; absent from the ADR log — no text to migrate. |
| ADR-0037 | *(not present in LOG.yaml)* | RETIRE | — | Not authored; absent from the ADR log — no text to migrate. |
| ADR-0038 | *(not present in LOG.yaml)* | RETIRE | — | Not authored; absent from the ADR log — no text to migrate. |
| ADR-0039 | *(not present in LOG.yaml)* | RETIRE | — | Not authored; absent from the ADR log — no text to migrate. |
| ADR-0040 | *(not present in LOG.yaml)* | RETIRE | — | Not authored; absent from the ADR log — no text to migrate. |
| ADR-0041 | *(not present in LOG.yaml)* | RETIRE | — | Not authored; absent from the ADR log — no text to migrate. |
| ADR-0042 | *(not present in LOG.yaml)* | RETIRE | — | Not authored; absent from the ADR log — no text to migrate. |
| ADR-0043 | *(not present in LOG.yaml)* | RETIRE | — | Not authored; absent from the ADR log — no text to migrate. |
| ADR-0044 | *(not present in LOG.yaml)* | RETIRE | — | Not authored; absent from the ADR log — no text to migrate. |
| ADR-0045 | *(not present in LOG.yaml)* | RETIRE | — | Not authored; absent from the ADR log — no text to migrate. |
| ADR-0046 | Vault is a shell-side data scope; vaultId propagates via vault:selected ShellBus event, not as a fifth auth property | CORPUS | — | Names the vault:selected bus event that pod repos subscribe to; Condition B — defines an inter-repo data-scope propagation contract. |
| ADR-0047 | Single-nav-pod apps declare explicit defaultRoute; /dashboard always registered | SHELL-LOCAL | — | Internal shell AppConfig routing rule; defaultRoute is a shell build-time declaration with no cross-repo dependency. |
| ADR-0048 | Local dev auth uses mock-me.ts + VITE_LOCAL_JWT + Vite /api proxy; real OAuth is impossible from localhost | SHELL-LOCAL | — | Entirely internal shell developer tooling (mock-me.ts, VITE_LOCAL_JWT, Vite proxy); no other repo's behaviour depends on this mechanism. |
| ADR-0049 | .env is committed with non-secret defaults; .env.local is gitignored for secrets | SHELL-LOCAL | — | Internal shell repo file-management convention; governs only the shell repo's .env handling. |
| ADR-0050 | src/config/remotes.ts is the only module that constructs authenticated outgoing HTTP requests | CORPUS | Connection-layer | Defines the authenticated HTTP boundary (remotes.ts + authenticatedFetch) that all service code must respect; DRAFT-ADR-0053 amends this for the pod-sdk service layer, establishing a cross-repo security constraint; Condition B — defines the inter-repo authentication construction protocol. |
| ADR-0051 | env.catalog.json and VITE_ENV are the canonical environment configuration system; vite.config.ts resolves all vars at build time | SHELL-LOCAL | — | Internal shell build/config system (env.catalog.json, VITE_ENV); no other repo's code depends on this mechanism — it is build-tooling for the shell only. |
| ADR-0052 | Proxy adapter layer: env.catalog.json PROXIES section drives both dev proxy (Vite) and prod proxy (Edge Function) | CORPUS | Connection-layer | Declares the proxy catalog that governs shell connectivity to all backend services; Condition B — establishes the access-path protocol between the shell and multiple backend repos and must be ratified alongside the connection-layer cluster. |
| ADR-0053 (accepted) | Analyte/field catalog is a shell-owned service; static dictionary now, /meta-backed and bus-distributed later | CORPUS | — | Names the analytes:catalog ShellBus event that pod repos subscribe to; also defines the inter-repo analyte vocabulary (canonical ids) that both shell and pods must use; Condition B — inter-repo contract for shared domain data. |
| DRAFT-ADR-0053 (proposed) | Pod backend access goes through an interface-based service layer, wired at runtime via a module-level container and reached only through pod-sdk | CORPUS | Connection-layer | Amends ADR-0050 to define the pod-sdk service interface contract — how pod repos access backends through typed service hooks; Condition B — defines the inter-repo service consumption protocol; ratifies last in the connection-layer cluster. |
| ADR-0054 | Non-pod utility surfaces are declared in one registry with a category taxonomy; domain-knowledge surfaces get the /reference namespace | SHELL-LOCAL | — | Internal shell routing/registry for non-pod utility surfaces; utility surfaces are explicitly NOT pods, NOT bound by the inter-repo pod contract; governs only internal shell route architecture. |

---

## Dependency Clusters

### Connection-layer cluster

**Members**: ADR-0004, ADR-0015, ADR-0017, ADR-0050, ADR-0052, DRAFT-ADR-0053

**Theme**: All decisions that govern how the shell and pod repos authenticate,
reach backends, handle CORS, proxy traffic, and structure service access.
Each later ADR in the cluster builds on or amends an earlier one.

**Intra-cluster ratification ordering**:

1. **ADR-0004** — establishes the four-property auth contract and the `accessToken`
   field that all subsequent connection decisions assume.
2. **ADR-0017** — establishes the CORS policy that backends must satisfy; presupposes
   that authenticated connections exist (ADR-0004).
3. **ADR-0015** — defines the transitional data-access pattern (Supabase direct →
   API layer); presupposes the auth contract (ADR-0004) and the CORS policy
   (ADR-0017).
4. **ADR-0050** — defines `remotes.ts` as the sole authenticated-fetch boundary;
   presupposes the auth token from ADR-0004, the CORS policy from ADR-0017, and the
   stage-transition intent from ADR-0015.
5. **ADR-0052** — defines the proxy catalog that governs how the shell reaches
   backends; presupposes the remotes.ts boundary (ADR-0050) and the CORS policy
   (ADR-0017).
6. **DRAFT-ADR-0053** — amends ADR-0050 to introduce the pod-sdk service layer;
   must ratify last because it revises the connection-layer invariants established
   by all earlier members.

---

### Design-system cluster

**Members**: ADR-0003 (SHELL-LOCAL), ADR-0012 (CORPUS)

**Theme**: Visual consistency between the shell's design system and pod repos —
Light DOM (token cascade) and component library (shared primitives).

**Intra-cluster ratification ordering**:

1. **ADR-0003** — SHELL-LOCAL; establishes the Light DOM / no-Shadow-DOM rule.
   Does not enter the corpus but must be settled in the shell repo before ADR-0012
   is ratified, because ADR-0012's rationale rests on the Light DOM guarantee.
2. **ADR-0012** — CORPUS; defines the component library rule and the one-way DAG;
   presupposes the Light DOM constraint from ADR-0003.

> Note: ADR-0003 is SHELL-LOCAL and will not be ratified in the corpus. It is
> listed here because ADR-0012 depends on it; the ordering must be respected when
> migrating ADR-0003 to the shell repo's local ADR home.

---

### Gabe cluster

**Members**: ADR-0006, ADR-0010, ADR-0011, ADR-0018

**Theme**: All decisions governing how pods interact with the Gabe AI assistant —
the bus event protocol, context injection, concurrency model, and tool invocation.

**Intra-cluster ratification ordering**:

1. **ADR-0006** — defines the foundational gabe:prompt / gabe:message event contract
   and requestId correlation; base for all subsequent Gabe decisions.
2. **ADR-0010** — defines how the shell merges pod context into the user turn;
   presupposes the gabe:prompt event shape (ADR-0006). Shell-local, but ratified
   after ADR-0006 to record its dependency clearly.
3. **ADR-0011** — defines the isSilentStreamingRef concurrency guard; presupposes
   the streaming model from ADR-0006. Shell-local, but ratified after ADR-0006.
4. **ADR-0018** — defines the MCP tool registry (mcp:register, gabe:tool:call,
   gabe:tool:result) and supersedes the `actions` array from ADR-0006; must ratify
   last as it amends the Gabe contract established in ADR-0006.

> Note: ADR-0010 and ADR-0011 are SHELL-LOCAL dispositions but are included in the
> cluster for ratification ordering purposes — they must be recorded as carried or
> left in the shell-local ADR home in dependency sequence with the corpus ADRs they
> reference.

---

## Summary Counts

| Disposition | Count | Members |
|-------------|-------|---------|
| CORPUS | 17 | ADR-0001, 0002, 0004, 0005, 0006, 0007, 0009, 0012, 0014, 0015, 0017, 0018, 0046, 0050, 0052, 0053 (accepted), DRAFT-ADR-0053 (proposed) |
| SHELL-LOCAL | 11 | ADR-0003, 0008, 0010, 0011, 0013, 0016, 0047, 0048, 0049, 0051, 0054 |
| RETIRE | 27 | ADR-0019 through ADR-0045 (all absent from LOG.yaml — never authored) |
| **Total** | **55** | ADR-0001..0054 (54 IDs) + DRAFT-ADR-0053 = 55 triage rows |

---

## Notes

1. **ADR-0053 ID collision**: `LOG.yaml` contains an accepted ADR-0053 (analyte/field
   catalog, 2026-05-29). The file `DRAFT-ADR-0053-pod-service-layer.yaml` contains a
   separate proposed ADR also numbered ADR-0053 (pod service layer, 2026-05-26).
   The relocation issue (LVGOV-2026-0004) must resolve this ID collision before
   the draft enters the log. In this triage both are treated as distinct entries.

2. **ADR-0019..0045 (27 IDs)**: These IDs do not appear in LOG.yaml or INDEX.yaml.
   They are treated as never-authored (RETIRE). No text to carry or migrate.

3. **Cluster members ADR-0010 and ADR-0011**: Assigned SHELL-LOCAL by the boundary
   rule, but listed in the Gabe cluster for ratification ordering because their
   implementation depends on ADR-0006. They remain in the shell repo's local ADR
   home; they are not carried into the corpus.
