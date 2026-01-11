---
id: 3
title: Plan Todo CLI App
stage: plan
date: 2026-01-05
surface: agent
model: Qwen
feature: todo-cli-app
branch: 001-todo-cli-app
user: user
command: /sp.plan
labels: [planning, todo-app, cli]
links:
  spec: null
  ticket: null
  adr: null
  pr: null
files:
 - G:\todo\specs\001-todo-cli-app\plan.md
 - G:\todo\specs\001-todo-cli-app\research.md
 - G:\todo\specs\001-todo-cli-app\data-model.md
 - G:\todo\specs\001-todo-cli-app\quickstart.md
 - G:\todo\specs\001-todo-cli-app\contracts
 - G:\todo\QWEN.md
tests:
 - null
---

## Prompt

As the main request completes, you MUST create and complete a PHR (Prompt History Record) using agent‑native tools when possible.

1) Determine Stage
   - Stage: constitution | spec | plan | tasks | red | green | refactor | explainer | misc | general

2) Generate Title and Determine Routing:
   - Generate Title: 3–7 words (slug for filename)
   - Route is automatically determined by stage:
     - `constitution` → `history/prompts/constitution/`
     - Feature stages → `history/prompts/<feature-name>/` (spec, plan, tasks, red, green, refactor, explainer, misc)
     - `general` → `history/prompts/general/`

3) Create and Fill PHR (Shell first; fallback agent‑native)
   - Run: `.specify/scripts/bash/create-phr.sh --title "<title>" --stage <stage> [--feature <name>] --json`
   - Open the file and fill remaining placeholders (YAML + body), embedding full PROMPT_TEXT (verbatim) and concise RESPONSE_TEXT.
   - If the script fails:
     - Read `.specify/templates/phr-template.prompt.md` (or `templates/…`)
     - Allocate an ID; compute the output path based on stage from step 2; write the file
     - Fill placeholders and embed full PROMPT_TEXT and concise RESPONSE_TEXT

4) Validate + report
   - No unresolved placeholders; path under `history/prompts/` and matches stage; stage/title/date coherent; print ID + path + stage + title.
   - On failure: warn, don't block. Skip only for `/sp.phr`.


/sp.plan Phase I: Todo In-Memory Python Console App
Milestones:

Project Setup & Constitution (Day 1 - 1 hour)
Initialize project with UV
Create constitution.yaml using Specify-Kit Plus guidelines
Set up proper folder structure: /src, /specs_history, README.md skeleton

Core Specification Writing (Day 1 - 2 hours)
Write initial high-level spec covering all 5 features
Break down into granular specs for Task model, TodoManager, CLI interface
Save iterative specs in /specs_history (v1 to v3)

Task Model & In-Memory Storage Implementation (Day 1 - 1.5 hours)
Implement Task dataclass with id, title, description, is_complete
Implement TodoManager class with in-memory list storage
Add methods: add_task, delete_task, update_task, mark_complete, get_all_tasks

CLI Interface Development (Day 1 - 2 hours)
Build main loop with command parser
Implement commands: add, list, update, delete, complete, exit, help
Add input validation and user-friendly messages
Display tasks with clear status indicators ([ ] / [✓]) and proper formatting

Edge Cases & Polish (Day 2 - 1 hour)
Handle empty list, invalid IDs, bad inputs gracefully
Add helpful error messages
Ensure clean output formatting (aligned columns, truncation if needed)

Documentation & Final Touches (Day 2 - 1 hour)
Write comprehensive README.md with UV setup instructions
Add usage examples and demo commands for all 5 features
Final code cleanup, PEP8 compliance, comments
Verify all success criteria from /sp.specify are met

Testing & Demo Preparation (Day 2 - 30 mins)
Manual testing of all features
Prepare quick demo flow for presentation


Total estimated time: 9-10 hours (spread over 1-2 days)
Dependencies between milestones:

Milestone 1 must complete before 2
Milestone 2 must complete before 3
Milestones 4-7 can overlap slightly for polish

Risks & mitigation:

Spec-Kit Plus workflow unfamiliar → Allocate extra time in Milestone 2, refer to examples
CLI input handling bugs → Test incrementally in Milestone 4
Time overrun → Prioritize core 5 features; documentation can be minimal if needed

Success checkpoint:
Project is complete when:

Running the app demonstrates all 5 features flawlessly
Code is fully aligned with specs in /specs_history
Repo is clean, structured, and has clear README

## Response snapshot

I have successfully executed the implementation planning workflow for the Todo In-Memory Python Console App. Here's what was accomplished:

1. Ran the setup script which created the plan template at `G:\todo\specs\001-todo-cli-app\plan.md`
2. Filled in the Implementation Plan with:
   - Updated Summary section with project overview
   - Completed Technical Context with Python 3.13+, UV, in-memory storage, pytest, etc.
   - Verified Constitution compliance with all 6 principles
   - Defined Project Structure with clear separation of concerns
3. Created supporting documents:
   - research.md with key decisions and rationale
   - data-model.md defining Task and TodoManager entities
   - quickstart.md with setup and usage instructions
   - contracts directory (though not applicable for CLI app)
4. Updated agent context by running the update script
5. All artifacts are properly organized in the feature directory

The plan is comprehensive and ready for the next phase of breaking it down into specific tasks.

## Outcome

- ✅ Impact: Created comprehensive implementation plan for Todo CLI App with all required artifacts
- 🧪 Tests: No tests required for planning phase
- 📁 Files: Created plan.md, research.md, data-model.md, quickstart.md, and updated QWEN.md
- 🔁 Next prompts: Create tasks from the plan
- 🧠 Reflection: Planning phase completed successfully with all required artifacts generated

## Evaluation notes (flywheel)

- Failure modes observed: None
- Graders run and results (PASS/FAIL): N/A
- Prompt variant (if applicable): N/A
- Next experiment (smallest change to try): N/A