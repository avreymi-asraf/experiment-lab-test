# Reject journal. A record for the user and for whoever maintains the system's content. Not instructions.

## 2026-11-11 · `add` stored retyped text, with no route defined for a connector

- Request: the tool test's request (not in this session). Wide: read outside sources for G-01 and add them to the cortex.
- What the lab did: cortex `add` assumed a PDF tool and `sources/raw/`; neither existed, arxiv, PubMed and ACL Anthology were blocked, and the only working route was a fetch connector that returns text into the conversation. The worker retyped passages by hand into `cortex/sources/text/`.
- Reject: "`add` assumes a PDF tool and a sources/raw/ folder. Neither existed. [...] The agent retyped passages by hand into sources/text/. A later re-fetch found no changed words, but nothing in the process guarantees that."
- What the agent had: the `cortex` skill (step 2 named one tool and one folder), the lab profile, the connector.
- Belief: "Stored text is whatever I write into sources/text/; the skill's route does not apply here, so any route will do."
- Root: the skill described one route and no others, and nothing distinguished a tool's output from an agent's typing. `check` also accepted quotes found in the source note, the agent's own words.
- Neighbors: passages paraphrased or "repaired" while copying; a stored passage cut so it loses the sentence with the model or population; a quote matched against the note's summary; a source abandoned silently when no route works.
- Change: `cortex` skill (source): routes in order of preference, `cortex.py store` (file or stdin, no overwrite, `--compare` against a second fetch), quotes checked only against `sources/text/`, passages stored with the sentences that carry their conditions. Lab: profile layout row and source template (`route:`).
- Check: scratch cortex: `store`, refusal to overwrite, `--compare` caught one changed digit, a quote that only matched the note failed `check`.

## 2026-11-11 · No outcome for a source whose text could not be obtained

- Request: as above.
- What the lab did: the source was found and its text not obtained; the agent could only leave a note in a gap row.
- Reject: "There is no outcome for \"source found but text not obtained\". The agent could only leave a note in a gap row."
- What the agent had: the skill's `read: full | partial | abstract only`; no form for a lead.
- Belief: "A source I could not read has no place in the cortex."
- Root: the source note had no value for it and `investigate` named no place for leads.
- Neighbors: claims written from a search snippet to give the source somewhere to live; the same blocked source searched again by the next agent; a lead lost in a gap row's prose.
- Change: `cortex` skill (source): `read: not obtained` with the routes tried; a lead yields no claims; `check` errors on a quote of a lead and lists leads. Lab: source template.
- Check: scratch cortex: a quote of a `not obtained` source fails `check`.

## 2026-11-11 · A delegated agent verified its own claims

- Request: as above.
- What the lab did: a delegated worker that could not start agents checked its own seven claims and set `verified: pass`; they left the `pairs` queue.
- Reject: "Blind verification says \"a fresh agent runs `cortex.py pairs`\". A delegated agent cannot spawn agents. One agent checked its own claims, set `verified: pass`, and they disappeared from the `pairs` queue."
- What the agent had: `add` step 4 ("start a fresh agent", "a claim leaves an `add` as `pass`, or not at all"), and no way to start one.
- Belief: "When I cannot start a verifier, my own careful re-read is the closest substitute, and the step must end in `pass`."
- Root: the skill assumed every agent can start another and demanded `pass` before the `add` ends; it said nothing about who runs a fresh-context step otherwise.
- Neighbors: a worker that cannot spawn running `review` or the `add`s of an `investigate` in its own context; a caller reading the source itself; a verifier given the writer's notes "to save time".
- Change: `cortex` skill (source): `verified` is never the writer's verdict; `/cortex verify`; one rule for every fresh-context step (start it, or hand it back as Pending with its brief; the delegating session starts it); `check` prints how many claims wait. Lab: profile §4 and §6, claim template.
- Check: not tested with a delegated agent. `check` on the lab prints the waiting count.

## 2026-11-11 · Skill and lab disagreed on correcting a partial claim

- Request: as above.
- What the lab did: the verifier superseded two partial claims, creating new claims that needed their own verification.
- Reject: "The skill says a partial claim is narrowed and verified again. The lab says a claim is never rewritten. The verifier superseded instead, which created new claims that needed their own verification."
- What the agent had: the skill (both "never rewritten" and "narrow and verify again"), `AGENTS.md`, the profile and the claim template ("never rewritten").
- Belief: "Never rewritten applies from the moment a claim file exists."
- Root: two places said different things, and neither said when a claim stops being a draft.
- Neighbors: a typo-level narrowing done as a supersede; a failed claim kept as `withdrawn` though nothing ever relied on it; a verified claim edited in place after a later contradiction because "the skill allows narrowing".
- Change: one rule, owner's decision: at verification a `partial` is narrowed in place and verified again, a `fail` deleted; after it passes, and from the start for experiment claims, never rewritten or deleted. In the skill's [Claims] (source) and once in the lab's profile §4; `AGENTS.md` and the claim template point there. Lab cleanup: the two superseded claims deleted, the partial one narrowed.
- Check: `cortex.py check --also experiments` clean; 1 claim waits for verification.
