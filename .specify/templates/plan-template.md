# Implementation Plan: [FEATURE]

**Branch**: `[###-feature-name]` | **Date**: [DATE] | **Spec**: [link]
**Input**: Feature specification from `/specs/[###-feature-name]/spec.md`

**Note**: This template is filled in by the `/speckit.plan` command. See `.specify/templates/commands/plan.md` for the execution workflow.

## Summary

[Extract from feature spec: primary requirement + technical approach from research]

## Technical Context

<!--
  ACTION REQUIRED: Replace the content in this section with the technical details
  for the project. The structure here is presented in advisory capacity to guide
  the iteration process.
-->

**Language/Version**: TypeScript (strict mode), Node.js LTS
**Primary Dependencies**: Next.js (App Router), React 18+, [additional as needed]
**Storage**: [if applicable, e.g., PostgreSQL, MongoDB, Redis or N/A]
**Testing**: Jest, React Testing Library (88% coverage minimum)
**Target Platform**: Web (browser + Node.js server), Future: Kubernetes
**Project Type**: web (Next.js full-stack application)
**Performance Goals**: [domain-specific, e.g., <3s initial page load, <1s navigation or NEEDS CLARIFICATION]
**Constraints**: Cloud-native patterns (stateless, config via env vars, health endpoints)
**Scale/Scope**: [domain-specific, e.g., 10k users, 100+ components, 20+ pages or NEEDS CLARIFICATION]

## Constitution Check

*GATE: Must pass before Phase 0 research. Re-check after Phase 1 design.*

Verify compliance with `.specify/memory/constitution.md`:

- [ ] **TypeScript-Only**: All code written in TypeScript with `strict: true`
- [ ] **Test-First**: Tests written and approved before implementation (88% coverage minimum)
- [ ] **Cloud-Native**: Stateless design, environment-based config, health endpoints
- [ ] **Next.js Best Practices**: App Router, Server Components by default, proper data fetching
- [ ] **Security Awareness**: No hardcoded secrets, input validation, vulnerability prevention
- [ ] **Documentation**: README, API docs, component docs, ADRs for significant decisions

**Violations requiring justification**: [List any constitution principles this feature cannot follow and why]

## Project Structure

### Documentation (this feature)

```text
specs/[###-feature]/
├── plan.md              # This file (/speckit.plan command output)
├── research.md          # Phase 0 output (/speckit.plan command)
├── data-model.md        # Phase 1 output (/speckit.plan command)
├── quickstart.md        # Phase 1 output (/speckit.plan command)
├── contracts/           # Phase 1 output (/speckit.plan command)
└── tasks.md             # Phase 2 output (/speckit.tasks command - NOT created by /speckit.plan)
```

### Source Code (repository root)
<!--
  ACTION REQUIRED: Expand this structure with the actual directories and files
  needed for this feature. Add specific paths like app/api/users/, components/auth/, etc.
-->

```text
# Next.js App Router Structure
app/
├── api/                    # API routes
│   └── [feature]/         # Feature-specific endpoints
├── [feature]/             # Feature pages (routes)
│   ├── page.tsx          # Page component (Server Component by default)
│   ├── layout.tsx        # Layout for this route
│   └── loading.tsx       # Loading UI
├── layout.tsx            # Root layout
└── page.tsx              # Home page

components/
├── ui/                   # Reusable UI components
├── forms/                # Form components
└── [feature]/           # Feature-specific components

lib/
├── utils/               # Utility functions
├── hooks/               # Custom React hooks
├── types/               # TypeScript type definitions
└── api/                 # API client functions

__tests__/
├── integration/         # Integration tests
├── unit/                # Unit tests
└── components/          # Component tests

public/                  # Static assets
└── [images, fonts, etc.]
```

**Structure Decision**: Using Next.js App Router with TypeScript. Server Components by default,
Client Components marked with 'use client' directive. API routes in app/api/, shared components
in components/, utilities in lib/.

## Complexity Tracking

> **Fill ONLY if Constitution Check has violations that must be justified**

| Violation | Why Needed | Simpler Alternative Rejected Because |
|-----------|------------|-------------------------------------|
| [e.g., 4th project] | [current need] | [why 3 projects insufficient] |
| [e.g., Repository pattern] | [specific problem] | [why direct DB access insufficient] |
