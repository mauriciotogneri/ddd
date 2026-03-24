# Document Types

DDD defines six document types, produced in a specific order. The first three are required for every change; the remaining three are used when the change warrants them.

## Required Documents

### 1. Requirements (`requirements.md`)

Defines what the system must do and why. This is the starting point for every change.

- **Purpose**: Capture the intent, scope, functional requirements, non-functional requirements, constraints, and acceptance criteria for a change.
- **When produced**: First. The team starts here.
- **Who produces it**: The team, with AI assistance. The AI helps structure and draft; the team reviews and refines.
- **Key sections**: Intent, context and background, decisions (choice + rationale), scope boundaries (in/out), functional requirements table, non-functional requirements, acceptance criteria.

### 2. Plan (`plan.md`)

A phased, step-by-step implementation plan that the AI agent will follow to write code.

- **Purpose**: Break the requirements into concrete, ordered implementation steps. Each step should be specific enough that two developers (or agents) following the plan independently would produce the same result.
- **When produced**: After requirements are reviewed and approved.
- **Who produces it**: The AI agent, from the requirements. The team reviews and refines.
- **Key sections**: Phases with numbered steps and checkboxes, file paths, dependencies between steps, verification phase, testing phase. The testing phase should specify that tests are written before implementation code (test-first), mapping each test file to the scenario IDs it covers and the test layer it operates at (as defined by the project's testing standards). A single scenario may require coverage across multiple layers — for example, `SC-04-01` might need a Domain test for input validation, an Infrastructure test for persistence, and an Application test for orchestration.

### 3. Scenarios (`scenarios.md`)

Validation scenarios in Gherkin format that define the observable behaviors the implementation must satisfy. Scenarios are the single source of truth for _what_ to test; the plan's testing phase defines _how_ by mapping test files back to scenario IDs with their test layer.

- **Purpose**: Define the contract between requirements and implementation in a testable format. Cover happy paths, error paths, edge cases, and boundary values.
- **When produced**: After requirements are reviewed, typically alongside the plan.
- **Who produces it**: The AI agent, from the requirements. The team reviews and refines.
- **Key sections**: Feature blocks, scenarios grouped by requirement with stable IDs (e.g., `SC-04-01`), scenario outlines with data tables for variations.

## Optional Documents

### 4. API Specification (`api.md`)

Documents the API endpoints, request/response schemas, error handling, and authentication relevant to the change.

- **When to include**: When the change introduces or modifies API interactions.
- **Who produces it**: The team or AI agent, depending on whether the API is being designed or documented.

### 5. Data Model (`data-model.md`)

Documents data structures, schemas, relationships, indexes, and constraints relevant to the change.

- **When to include**: When the change introduces or modifies persisted data structures.
- **Who produces it**: The team or AI agent.

### 6. Implementation Record (`implementation.md`)

Post-implementation record documenting what was actually built, including files created or modified, key decisions, deviations from the plan, and verification results.

- **When to include**: After implementation is complete.
- **Who produces it**: The AI agent, after writing the code. This document closes the loop — it records what happened, not what was planned.

# Directory Structure

DDD organizes documents into directories that reflect the lifecycle of a change.

| Directory    | Purpose                                                                                                                                                |
| ------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `roadmap/`   | Future changes not yet started. Each item is a high-level description of a planned feature or improvement, ordered by priority.                        |
| `changes/`   | In-progress change requests. When the team decides to start working on a roadmap item, it moves here and the team begins creating its document set.    |
| `product/`   | Completed changes. Moved here from `changes/` when the team accepts the implementation.                                                                |
| `standards/` | Review checklists for each document type. These govern how documents are written and reviewed.                                                         |
| `technical/` | Application-level rules. These govern how the application is built.                                                                                    |
| `reference/` | Project context: product vision, glossary, setup guide, deployment instructions. Useful for onboarding and for the AI agent to understand the project. |

## Organizing the Product Directory

The `product/` directory accumulates every completed change over time. As the number of changes grows, the team should organize them into a hierarchy that reflects how the team thinks about the product. DDD does not prescribe a single hierarchy — the right structure depends on the team's domain and workflow. Two common approaches:

### Top-Down (Business-Led)

Organizes changes by business goals and works downward into implementation detail.

- **Goal** (e.g., increase user retention)
  - **Epic** (e.g., build an automated loyalty program)
    - **Feature** (e.g., reward point tracking system)
      - **Requirement** (e.g., user receives 10 points per purchase)
        - **Task** (e.g., API endpoint logic + database schema)

### Domain-Driven (Service-Led)

Organizes changes by technical domain boundaries and works downward into service contracts.

- **Domain** (e.g., payments)
  - **Bounded Context** (e.g., invoicing)
    - **Service/Module** (e.g., PDF Generator)
      - **API/Interface Contract** (e.g., `POST /v1/generate-invoice`)
        - **Implementation Specs** (e.g., logic for template rendering)

The team picks whichever hierarchy best matches how they navigate and reason about the product. The key requirement is consistency — once a hierarchy is chosen, all completed changes should be filed within it.
