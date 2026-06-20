---
version: 1.0.0
layer: constitutive
status: ratified
ratified_by: LandVault Platform Steward
ratified_at: '2026-06-10'
supersedes: ~
---

# LandVault Platform Governance Constitution

## Purpose and Scope <!-- informative -->

This document is the constitutive instrument of the LandVault Platform
governance corpus. It defines how instruments in this corpus acquire and lose
authority, who holds the ratifying act, and what may and may not be governed
here. Every ADR and RFC process artifact in this corpus derives its authority
from this document. No instrument in this corpus has binding force except as
conferred by the ratification process defined below.

This corpus operates under delegated authority from Enterprise Governance. It
sits beneath Enterprise Governance in the instrument hierarchy. No instrument
issued within this corpus may contradict any Enterprise Governance instrument.
Where conflict exists, the Enterprise Governance instrument prevails without
exception.

---

## Section 1 — ADR Lifecycle <!-- normative -->

An Architecture Decision Record (ADR) in this corpus passes through a defined
lifecycle. The lifecycle governs when an ADR acquires binding force and when
that force is retired. Bindingness is a status conferred by ratification; it
does not arise from authorship, assertion, or the passage of time alone.

### 1.1 Status values

**`proposed`** — The ADR has been posted and the objection window is open.
The ADR has no binding force in this status. Any affected in-scope repository
may raise a blocking concern during this window.

**`ratified`** — The ADR has passed the ratification process defined in
Section 2. The ADR is binding in the scope specified in the ADR's own
`scope` field. Ratification is the sole mechanism by which an ADR acquires
binding force; no other act or endorsement confers it.

**`superseded`** — The ADR has been replaced by a later ratified ADR. The
later ADR must identify this one in its `supersedes` field. A superseded ADR
retains no binding force. Its text is preserved for historical record.

**`withdrawn`** — The ADR was retracted before ratification. A withdrawn ADR
never acquired binding force. Its text is preserved for historical record. The
reason for withdrawal must be recorded in the ADR's `withdrawn_reason` field.

**`retired`** — The ADR's binding force has been explicitly lifted without a
successor ADR. The decision the ADR captured is no longer in effect. A retired
ADR differs from a superseded ADR in that no successor decision replaces it;
the constraint or convention it imposed has been removed entirely. The reason
for retirement must be recorded in the ADR's `retired_reason` field.

**`CARRIED`** — A special dual-status applied to an ADR that is ratified at
its authoring repository (origin scope) but has not yet been ratified across
all platform repositories (platform scope). A CARRIED ADR carries both:
- `origin_status: ratified` — binding within the authoring repository
- `platform_status: proposed` — objection window open for remaining in-scope
  repositories

Ratification at origin establishes local authority; extension of scope to
additional repositories requires a separate ratification act covering those
repositories. The CARRIED status exists so teams may act on locally-ratified
decisions without waiting for platform-wide consensus to close, while still
formally signaling that platform ratification is pending.

### 1.2 Scoped bindingness

Bindingness is scoped: an ADR binds only the repositories and contracts named
in its `scope` field at the time of ratification. An ADR does not implicitly
bind a repository that was not named in scope at ratification. To extend
binding scope to newly-added repositories, the Platform Steward must execute a
new ratification act — either amending the ADR's scope and re-ratifying, or
issuing a follow-on ADR. The existing ratification does not automatically
extend to repositories added to the platform after the ADR was ratified.

---

## Section 2 — RFC Ratification Process <!-- normative -->

Ratification follows a rough-consensus model via RFC (Request for Comment).
The process is designed to prevent both imposition (through the right to
object) and deadlock (through the absence of a unanimity requirement).

### 2.1 Posting and objection window

An ADR is submitted to this corpus with status `proposed`. The Platform
Steward opens an objection window of no fewer than **five business days**.
During the window, any maintainer of an affected in-scope repository may
raise a blocking concern. Affected repositories are those named in the ADR's
`scope` field, or those whose operation would be materially changed by the ADR.

A concern is blocking if the raising party explicitly marks it as such and
states the harm that ratification would cause to their repository or its users.
A concern that does not identify specific harm is advisory, not blocking.

### 2.2 Resolution and rough consensus

Ratification does not require unanimity. It requires the absence of sustained
blocking objection. An objection is sustained if it has not been:
- resolved by amending the ADR to address the concern, or
- recorded and dismissed in accordance with Section 3 (Recorded-Objection
  Discipline).

When the objection window closes with no sustained blocking objections, the
Platform Steward may ratify the ADR by setting its status to `ratified` and
recording the ratification date. The Platform Steward may not ratify an ADR
over a sustained blocking objection without following Section 3.

### 2.3 ADR amendment before ratification

An ADR may be amended while in `proposed` status. An amendment that materially
changes the ADR's scope or decision restarts the objection window. An amendment
that corrects wording without changing substance does not restart the window,
but the Platform Steward must record that the amendment was made and confirm it
is non-substantive.

### 2.4 Re-ratification

A `ratified` ADR may be revised by posting a successor ADR. The successor
follows the same RFC process from `proposed`. Upon ratification of the
successor, the predecessor moves to `superseded`. The Platform Steward may
not alter the text of a ratified ADR in place; all changes go through a new
RFC cycle.

---

## Section 3 — Recorded-Objection Discipline <!-- normative -->

This section is binding, not advisory. It is the safeguard that prevents the
single-ratifier RFC model from degrading into imposition.

### 3.1 Obligation

A blocking objection from an affected repository **may not be dismissed**
without a recorded rationale. "Dismissed" means the Platform Steward proceeds
to ratify the ADR despite the objection remaining unresolved by amendment.

A recorded rationale must:
1. Identify the objecting party and the substance of their concern.
2. State why the concern does not prevent ratification — either because the
   concern is moot given the ADR's actual scope, because the harm identified
   does not materialize under the ADR as written, or because the platform
   interest outweighs the local concern and that judgment is being made
   explicitly.
3. Be written in the ADR's `dismissed_objections` field before the
   `ratified` status is set.

An ADR whose `ratified` status was set while a blocking objection remained
unaddressed and unrecorded is invalid. Its purported bindingness does not
arise.

### 3.2 What this rule is not

This rule does not require agreement. The Platform Steward may ratify an ADR
over a blocking objection when the recorded rationale satisfies the conditions
in 3.1. The objecting party does not hold a veto. The rule requires transparency
and explicit judgment, not consensus. The difference between governance and
imposition is not the absence of overruling — it is the presence of a recorded
reason.

### 3.3 Review right

A party whose blocking objection was dismissed may request that the Platform
Steward reconsider by presenting new information not available at the time of
dismissal. This request does not suspend the ADR's binding force. The Platform
Steward must respond within ten business days, either maintaining the dismissal
(with an updated record) or initiating a new RFC cycle.

---

## Section 4 — LandVault Platform Steward <!-- normative -->

### 4.1 Role definition

The **LandVault Platform Steward** is the accountable role responsible for the
integrity and operation of this corpus. The Steward is a role, not a named
individual; the person holding this role may change without amending this
document. The current holder of the Steward role is identified in the corpus
registry maintained by Enterprise Governance.

### 4.2 Responsibilities

The Platform Steward is responsible for:

**Corpus integrity** — Ensuring that every instrument in this corpus has passed
the ratification process defined in Section 2, that no unratified document is
presented as binding, and that the ADR log accurately reflects the status of
every ADR. The Steward is the last line of defense against process drift.

**The ratifying act** — Executing the formal ratification: setting ADR status
to `ratified`, recording the ratification date, and confirming that the
objection window has closed without sustained unrecorded objections. No ADR
may be ratified except by the Steward or a formally delegated deputy whose
scope and duration are recorded in the corpus.

**RFC queue health** — Keeping the pipeline of proposed ADRs moving. The Steward
ensures that objection windows open and close on schedule, that blocking
concerns receive timely responses, and that ADRs do not stall indefinitely in
`proposed` status. An ADR in `proposed` status for more than thirty calendar
days without documented progress is a queue health failure.

**Non-contradiction monitoring** — Watching for conflicts between newly
ratified corpus instruments and Enterprise Governance instruments. When a
potential conflict is identified, the Steward must surface it to the
Enterprise Governance Steward before proceeding with ratification.

**Entry point maintenance** — Ensuring the corpus entry point
(`https://miraterra.github.io/landvault-governance/`) remains accessible and
accurately reflects the current state of ratified instruments.

### 4.3 Delegation

The Steward may delegate specific acts to a named deputy for a bounded scope
and duration. Delegation is recorded in the corpus with the deputy's name,
the acts delegated, and the expiry date. The Steward remains accountable for
all delegated acts.

---

## Section 5 — Boundary Rule and Non-Contradiction Obligation <!-- normative -->

### 5.1 The cross-cutting boundary

A decision belongs in this corpus — and must be governed by the RFC process
defined in Section 2 — when it satisfies either of the following conditions:

**Condition A: Multi-repo binding.** The decision binds two or more
`landvault-*` repositories. Any rule, constraint, or convention that a team
cannot locally override without breaking a cross-repo contract belongs here,
not in the local repository.

**Condition B: Inter-repo contract definition.** The decision defines, names,
or constrains a contract between two or more repositories — an event type, an
API shape, a shared data structure, a capability protocol — regardless of how
many repositories are currently implementing it. A contract that exists between
two repositories is cross-cutting even if only one repository is currently a
live consumer.

### 5.2 The local boundary

A decision belongs in the local repository — and must remain there — when it
satisfies all of the following:

- It governs a concern that is entirely internal to one repository.
- No other repository's behaviour depends on or is constrained by the decision.
- The decision does not define a shared term, event type, or interface that
  appears in any inter-repo contract.

Local decisions are outside the scope of this corpus. The Platform Steward may
not use the RFC process to govern local decisions. Attempting to ratify a purely
local decision in this corpus is a process misuse.

### 5.3 Boundary disputes

When the Steward and a repository team disagree about whether a decision is
cross-cutting or local, the Steward has final authority to classify it. The
Steward's classification must be recorded with a one-sentence rationale. A team
that disputes the classification may escalate to the Enterprise Governance
Steward.

### 5.4 Non-contradiction obligation

Every in-scope repository's `CLAUDE.md` (or equivalent authoritative
configuration file) must not contradict any ratified corpus ADR. Where a local
CLAUDE.md rule and a ratified corpus ADR cover the same decision:
- The ratified corpus ADR prevails.
- The local CLAUDE.md rule that contradicts it is without force.
- The repository team must update their CLAUDE.md to defer to the corpus ADR
  within thirty calendar days of ratification.

Failure to update does not suspend the corpus ADR's binding force. The corpus
ADR is binding from the date of ratification regardless of whether the local
CLAUDE.md has been updated to reflect it.

### 5.5 Silence is not contradiction

A local CLAUDE.md that is silent on a matter governed by a ratified corpus ADR
does not contradict it. Silence means the corpus ADR governs by default. Local
CLAUDE.md files need not replicate corpus ADR content; they need only not
conflict with it.
