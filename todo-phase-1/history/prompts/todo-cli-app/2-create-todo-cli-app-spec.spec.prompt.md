---
id: 2
title: Create Todo CLI App Spec
stage: spec
date: 2026-01-05
surface: agent
model: Qwen
feature: todo-cli-app
branch: 001-todo-cli-app
user: user
command: /sp.specify
labels: [specification, todo-app, cli]
links:
  spec: null
  ticket: null
  adr: null
  pr: null
files:
 - G:\todo\specs\001-todo-cli-app\spec.md
 - G:\todo\specs\001-todo-cli-app\checklists\requirements.md
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


/sp.specify Phase I: Todo In-Memory Python Console App Objective: Develop a basic command-line todo application that manages tasks in memory using spec-driven development with Specify-Kit Plus. Target audience: Hackathon participants and Python developers learning spec-driven practices. Focus: Implement core CRUD operations for tasks (Add, Delete, Update, View, Mark Complete) with in-memory storage, emphasizing clean code and modular structure. Success criteria: All 5 basic features fully functional in CLI demo Code aligns 100% with generated specs from Specify-Kit Plus Application handles edge cases like invalid inputs, empty lists, and non-existent IDs README includes clear setup instructions and usage examples for each feature Project structure follows best practices with UV-managed dependencies Constraints: Storage: In-memory only (e.g., list or dict of tasks; no files or databases) Language: Python 3.13+ Tools: UV for project management, Specify-Kit Plus for specs Features: Limited to basic level; no advanced like priorities, due dates, or persistence Timeline: Complete within hackathon timeframe (e.g., 1-2 days) Code principles: PEP 8 compliant, modular (e.g., separate classes for Task and TodoManager) Not building: Persistent storage or database integration GUI or web-based interface User authentication or multi-user support Advanced search/filtering of tasks Integration with external APIs or services

## Response snapshot

I have successfully created the feature specification for the Todo CLI App. Here's what was accomplished:

1. Created a new branch named `001-todo-cli-app`
2. Created the specification file at `specs/001-todo-cli-app/spec.md` with:
   - 5 detailed user stories covering all required CRUD operations
   - Functional requirements (FR-001 to FR-010)
   - Key entities definition
   - Success criteria (SC-001 to SC-006)
   - Edge cases handling
3. Created a quality checklist at `specs/001-todo-cli-app/checklists/requirements.md`
4. All requirements were validated and marked as completed

The specification includes all 5 required features: Add, Delete, Update, View, and Mark Complete operations for tasks. The app will store tasks in memory only with no persistence, following the specified constraints.

## Outcome

- ✅ Impact: Created comprehensive feature specification for Todo CLI App with all required CRUD operations
- 🧪 Tests: No tests required for specification creation
- 📁 Files: Created spec.md and requirements.md in specs/001-todo-cli-app/
- 🔁 Next prompts: Build technical plan for the spec
- 🧠 Reflection: Specification successfully created with all required user stories and requirements

## Evaluation notes (flywheel)

- Failure modes observed: None
- Graders run and results (PASS/FAIL): N/A
- Prompt variant (if applicable): N/A
- Next experiment (smallest change to try): N/A