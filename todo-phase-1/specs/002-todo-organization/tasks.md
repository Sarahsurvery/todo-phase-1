---

description: "Task list for Todo Organization features"
---

# Tasks: Todo Organization Features

**Input**: Design documents from `/specs/002-todo-organization/`
**Prerequisites**: plan.md (required), spec.md (required for user stories), research.md, data-model.md, contracts/

**Tests**: The examples below include test tasks. Tests are OPTIONAL - only include them if explicitly requested in the feature specification.

**Organization**: Tasks are grouped by user story to enable independent implementation and testing of each story.

## Format: `[ID] [P?] [Story] Description`

- **[P]**: Can run in parallel (different files, no dependencies)
- **[Story]**: Which user story this task belongs to (e.g., US1, US2, US3)
- Include exact file paths in descriptions

## Path Conventions

- **Single project**: Code lives in root directory (no /src folder), `tests/` at repository root
- **Web app**: `backend/src/`, `frontend/src/`
- **Mobile**: `api/src/`, `ios/src/` or `android/src/`
- Paths shown below assume single project - adjust based on plan.md structure

<!--
  ============================================================================
  IMPORTANT: The tasks below are SAMPLE TASKS for illustration purposes only.

  The /sp.tasks command MUST replace these with actual tasks based on:
  - User stories from spec.md (with their priorities P1, P2, P3...)
  - Feature requirements from plan.md
  - Entities from data-model.md
  - Endpoints from contracts/

  Tasks MUST be organized by user story so each story can be:
  - Implemented independently
  - Tested independently
  - Delivered as an MVP increment

  DO NOT keep these sample tasks in the generated tasks.md file.
  ============================================================================
-->

## Phase 1: Setup (Shared Infrastructure)

**Purpose**: Project initialization and basic structure

- [X] T001 Create iOS project structure per implementation plan
- [X] T002 Initialize SwiftData model container with Task model
- [X] T003 [P] Configure project settings for iOS 17+ target

---

## Phase 2: Foundational (Blocking Prerequisites)

**Purpose**: Core infrastructure that MUST be complete before ANY user story can be implemented

**⚠️ CRITICAL**: No user story work can begin until this phase is complete

Examples of foundational tasks (adjust based on your project):

- [X] T004 Create Task model with priority and categories properties per data-model.md
- [X] T005 [P] Create TaskPriority enum with display properties
- [X] T006 [P] Create Filter and SortOrder models per data-model.md
- [X] T007 Create TaskViewModel with basic CRUD operations
- [X] T008 Create TaskDataController for SwiftData operations
- [X] T009 Create basic UI components: PriorityIndicator and CategoryBadge

**Checkpoint**: Foundation ready - user story implementation can now begin in parallel

---

## Phase 3: User Story 1 - Assign Priority & Categories to Tasks (Priority: P1) 🎯 MVP

**Goal**: Allow users to assign priority levels (High, Medium, Low) and categories/tags to tasks with visual indicators

**Independent Test**: Can successfully add priority and category information to a task and see visual indicators (colors for priority, badges for categories) in the task list.

### Tests for User Story 1 (OPTIONAL - only if tests requested) ⚠️

> **NOTE: Write these tests FIRST, ensure they FAIL before implementation**

- [ ] T010 [P] [US1] Unit test for Task model priority and categories functionality in Tests/Unit/Models/TestTask.swift
- [ ] T011 [P] [US1] Unit test for TaskViewModel priority and category update methods in Tests/Unit/ViewModels/TestTaskViewModel.swift

### Implementation for User Story 1

- [X] T012 [P] [US1] Update Task model to include priority and categories properties in Models/Task.swift
- [X] T013 [P] [US1] Create TaskPriority enum with display properties in Models/TaskPriority.swift
- [X] T014 [US1] Update TaskFormView to include priority selection and category input in Views/TaskFormView.swift
- [X] T015 [US1] Update TaskListView to display priority indicators and category badges in Views/TaskListView.swift
- [X] T016 [P] [US1] Create PriorityIndicator component in Views/Components/PriorityIndicator.swift
- [X] T017 [P] [US1] Create CategoryBadge component in Views/Components/CategoryBadge.swift
- [X] T018 [US1] Update TaskViewModel to handle priority and category updates in ViewModels/TaskViewModel.swift
- [X] T019 [US1] Update TaskDataController to persist priority and category data in Data/TaskDataController.swift

**Checkpoint**: At this point, User Story 1 should be fully functional and testable independently

---

## Phase 4: User Story 2 - Search Tasks by Keyword (Priority: P2)

**Goal**: Add a search bar to search tasks by keyword in the title or notes

**Independent Test**: Can enter a search term and see only matching tasks in the list.

### Tests for User Story 2 (OPTIONAL - only if tests requested) ⚠️

- [ ] T020 [P] [US2] Unit test for search functionality in Tests/Unit/ViewModels/TestTaskViewModel.swift
- [ ] T021 [P] [US2] Integration test for search in Tests/Integration/TestTaskSearch.swift

### Implementation for User Story 2

- [ ] T022 [P] [US2] Update TaskViewModel to include search functionality in ViewModels/TaskViewModel.swift
- [ ] T023 [US2] Update TaskListView to include searchable modifier in Views/TaskListView.swift
- [ ] T024 [US2] Implement search filtering logic in ViewModels/TaskViewModel.swift
- [ ] T025 [US2] Add search bar UI to TaskListView in Views/TaskListView.swift

**Checkpoint**: At this point, User Stories 1 AND 2 should both work independently

---

## Phase 5: User Story 3 - Filter Tasks by Status, Priority, and Category (Priority: P3)

**Goal**: Add filters for status (all/completed/pending), priority, and category

**Independent Test**: Can apply filters and see only the tasks that match the selected criteria.

### Tests for User Story 3 (OPTIONAL - only if tests requested) ⚠️

- [ ] T026 [P] [US3] Unit test for filter functionality in Tests/Unit/ViewModels/TestTaskViewModel.swift
- [ ] T027 [P] [US3] Integration test for filtering in Tests/Integration/TestTaskFilter.swift

### Implementation for User Story 3

- [ ] T028 [P] [US3] Update TaskViewModel to include filtering functionality in ViewModels/TaskViewModel.swift
- [ ] T029 [US3] Create Filter model per data-model.md in Models/Filter.swift
- [ ] T030 [US3] Add filter UI controls to TaskListView in Views/TaskListView.swift
- [ ] T031 [US3] Implement filter logic in ViewModels/TaskViewModel.swift
- [ ] T032 [US3] Add filter reset functionality in ViewModels/TaskViewModel.swift

**Checkpoint**: At this point, User Stories 1, 2 AND 3 should all work independently

---

## Phase 6: User Story 4 - Sort Tasks by Various Criteria (Priority: P4)

**Goal**: Allow sorting tasks by due date, priority, creation date, or alphabetically

**Independent Test**: Can select a sorting option and see the task list reorder accordingly.

### Tests for User Story 4 (OPTIONAL - only if tests requested) ⚠️

- [ ] T033 [P] [US4] Unit test for sort functionality in Tests/Unit/ViewModels/TestTaskViewModel.swift
- [ ] T034 [P] [US4] Integration test for sorting in Tests/Integration/TestTaskSort.swift

### Implementation for User Story 4

- [ ] T035 [P] [US4] Update TaskViewModel to include sorting functionality in ViewModels/TaskViewModel.swift
- [ ] T036 [US4] Create SortOrder enum per data-model.md in Models/SortOrder.swift
- [ ] T037 [US4] Add sort UI controls to TaskListView in Views/TaskListView.swift
- [ ] T038 [US4] Implement sorting logic in ViewModels/TaskViewModel.swift
- [ ] T039 [US4] Add sort order persistence in ViewModels/TaskViewModel.swift

**Checkpoint**: All user stories should now be independently functional

---

[Add more user story phases as needed, following the same pattern]

---

## Phase N: Polish & Cross-Cutting Concerns

**Purpose**: Improvements that affect multiple user stories

- [ ] T040 [P] Documentation updates in docs/
- [ ] T041 Code cleanup and refactoring
- [ ] T042 Performance optimization across all stories
- [ ] T043 [P] Additional unit tests (if requested) in Tests/Unit/
- [ ] T044 Security hardening
- [ ] T045 Run quickstart.md validation

---

## Dependencies & Execution Order

### Phase Dependencies

- **Setup (Phase 1)**: No dependencies - can start immediately
- **Foundational (Phase 2)**: Depends on Setup completion - BLOCKS all user stories
- **User Stories (Phase 3+)**: All depend on Foundational phase completion
  - User stories can then proceed in parallel (if staffed)
  - Or sequentially in priority order (P1 → P2 → P3)
- **Polish (Final Phase)**: Depends on all desired user stories being complete

### User Story Dependencies

- **User Story 1 (P1)**: Can start after Foundational (Phase 2) - No dependencies on other stories
- **User Story 2 (P2)**: Can start after Foundational (Phase 2) - May integrate with US1 but should be independently testable
- **User Story 3 (P3)**: Can start after Foundational (Phase 2) - May integrate with US1/US2 but should be independently testable
- **User Story 4 (P4)**: Can start after Foundational (Phase 2) - May integrate with US1/US2/US3 but should be independently testable

### Within Each User Story

- Tests (if included) MUST be written and FAIL before implementation
- Models before services
- Services before endpoints
- Core implementation before integration
- Story complete before moving to next priority

### Parallel Opportunities

- All Setup tasks marked [P] can run in parallel
- All Foundational tasks marked [P] can run in parallel (within Phase 2)
- Once Foundational phase completes, all user stories can start in parallel (if team capacity allows)
- All tests for a user story marked [P] can run in parallel
- Models within a story marked [P] can run in parallel
- Different user stories can be worked on in parallel by different team members

---

## Parallel Example: User Story 1

```bash
# Launch all tests for User Story 1 together (if tests requested):
Task: "Unit test for Task model priority and categories functionality in Tests/Unit/Models/TestTask.swift"
Task: "Unit test for TaskViewModel priority and category update methods in Tests/Unit/ViewModels/TestTaskViewModel.swift"

# Launch all models for User Story 1 together:
Task: "Update Task model to include priority and categories properties in Models/Task.swift"
Task: "Create TaskPriority enum with display properties in Models/TaskPriority.swift"
```

---

## Implementation Strategy

### MVP First (User Story 1 Only)

1. Complete Phase 1: Setup
2. Complete Phase 2: Foundational (CRITICAL - blocks all stories)
3. Complete Phase 3: User Story 1
4. **STOP and VALIDATE**: Test User Story 1 independently
5. Deploy/demo if ready

### Incremental Delivery

1. Complete Setup + Foundational → Foundation ready
2. Add User Story 1 → Test independently → Deploy/Demo (MVP!)
3. Add User Story 2 → Test independently → Deploy/Demo
4. Add User Story 3 → Test independently → Deploy/Demo
5. Add User Story 4 → Test independently → Deploy/Demo
6. Each story adds value without breaking previous stories

### Parallel Team Strategy

With multiple developers:

1. Team completes Setup + Foundational together
2. Once Foundational is done:
   - Developer A: User Story 1
   - Developer B: User Story 2
   - Developer C: User Story 3
   - Developer D: User Story 4
3. Stories complete and integrate independently

---

## Notes

- [P] tasks = different files, no dependencies
- [Story] label maps task to specific user story for traceability
- Each user story should be independently completable and testable
- Verify tests fail before implementing
- Commit after each task or logical group
- Stop at any checkpoint to validate story independently
- Avoid: vague tasks, same file conflicts, cross-story dependencies that break independence