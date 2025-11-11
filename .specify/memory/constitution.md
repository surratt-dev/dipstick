# Dipstick Constitution

## Core Principles

### I. TypeScript-Only Codebase
All application code MUST be written in TypeScript with strict type checking enabled. No JavaScript files are permitted in the codebase except for configuration files where TypeScript is not supported.

**Requirements**:
- `strict: true` in tsconfig.json
- No `any` types without explicit justification and approval
- Type definitions for all public APIs and shared utilities
- Prefer type inference where it improves readability without sacrificing clarity

### II. Component-Based Architecture
The application follows a modular, component-based architecture aligned with React and Next.js best practices.

**Requirements**:
- Functional components with hooks (no class components)
- Clear separation between presentation and business logic
- Reusable components in shared libraries/directories
- Server components by default in Next.js App Router; client components explicitly marked
- Component composition over prop drilling (use context or state management where appropriate)

### III. Test-First Development (NON-NEGOTIABLE)
Testing is mandatory with minimum 88% code coverage across the codebase.

**Requirements**:
- Unit tests for all business logic, utilities, and non-trivial components
- Integration tests for API routes, data flows, and critical user journeys
- Tests MUST be written and approved before implementation
- Red-Green-Refactor cycle: Tests fail → Implement → Tests pass → Refactor
- Coverage measured and enforced in CI/CD (88% minimum threshold)
- Test frameworks: Jest for unit tests, React Testing Library for component tests

### IV. Cloud-Native Patterns
Code must be structured to be Kubernetes-compatible without requiring immediate K8s infrastructure.

**Requirements**:
- Stateless application design (externalize session/state to databases or cache)
- Configuration via environment variables (12-factor app principles)
- Health check endpoints (`/health`, `/ready`)
- Graceful shutdown handling
- No local file system dependencies for persistent data
- Container-ready: assume horizontal scaling and ephemeral instances

### V. Next.js & React Best Practices
Leverage Next.js and React ecosystem patterns for maintainable, performant applications.

**Requirements**:
- Use Next.js App Router (not Pages Router) for new features
- Server-side rendering (SSR) and static generation (SSG) where appropriate
- API routes for backend logic (Next.js `/app/api` directory)
- Proper data fetching patterns (Server Components, `fetch` with caching)
- Code splitting and lazy loading for client bundles
- Follow React hooks rules and best practices

### VI. Security Awareness
While comprehensive security implementation is deferred, code must not introduce obvious vulnerabilities.

**Requirements**:
- No hardcoded secrets or credentials in code
- Input validation for all user-provided data
- Avoid common vulnerabilities: XSS, SQL injection, CSRF (use framework protections)
- Authentication and authorization placeholders where needed
- Security review required before production deployment (future phase)

### VII. Documentation Standards
Mature web application documentation practices MUST be followed.

**Requirements**:
- README.md with: project overview, tech stack, setup instructions, running locally
- Code comments for complex logic (not obvious code)
- API documentation for backend routes
- Component documentation for shared/reusable components
- Architecture decision records (ADRs) for significant technical decisions
- Contributing guidelines and development workflow documentation

## Development Standards

### Code Quality
- ESLint and Prettier enforced in CI/CD
- Consistent code style across the codebase
- Meaningful variable and function names
- DRY principle: extract reusable logic into utilities/hooks
- SOLID principles applied to business logic

### Version Control
- Descriptive commit messages following conventional commits format
- Feature branches from main branch
- Pull requests required for all changes
- Branch naming: `feature/`, `bugfix/`, `hotfix/` prefixes
- No direct commits to main branch

### Code Review
- All PRs require at least one approval
- Reviewers check: functionality, tests, type safety, adherence to constitution
- Address all review comments before merging
- Automated checks (tests, linting, coverage) must pass

### Performance Considerations
- While performance is not a primary concern initially, avoid obvious performance pitfalls
- Use React.memo, useMemo, useCallback judiciously (not prematurely)
- Optimize images and assets (Next.js Image component)
- Monitor bundle sizes; code split large dependencies

## Technology Stack

### Frontend
- **Framework**: Next.js (App Router)
- **UI Library**: React 18+
- **Language**: TypeScript (strict mode)
- **Styling**: [To be determined - Tailwind CSS, CSS Modules, styled-components, etc.]

### Backend
- **API Layer**: Next.js API Routes
- **Language**: TypeScript
- **Runtime**: Node.js

### Testing
- **Unit/Integration**: Jest
- **Component Testing**: React Testing Library
- **E2E** (future): Playwright or Cypress
- **Coverage Target**: 88% minimum

### Deployment (Future)
- **Container Orchestration**: Kubernetes
- **Container Runtime**: Docker
- **Cloud Provider**: [To be determined]

## Development Workflow

### Local Development Setup
1. Clone repository
2. Install dependencies: `npm install` or `yarn install`
3. Configure environment variables (`.env.local`)
4. Run development server: `npm run dev`
5. Run tests: `npm test`
6. Check coverage: `npm run test:coverage`

### Feature Development Process
1. Create feature branch from main
2. Write tests for new functionality
3. Implement feature with TypeScript
4. Ensure tests pass and coverage ≥ 88%
5. Update documentation if needed
6. Submit pull request
7. Address code review feedback
8. Merge after approval and passing CI

### Quality Gates
- All tests pass
- Code coverage ≥ 88%
- No TypeScript errors
- ESLint passes with no warnings
- Build succeeds
- Code review approved

## Governance

This constitution represents the foundational principles and standards for the Dipstick project. All team members, contributors, and AI assistants must adhere to these guidelines.

**Amendments**:
- Constitution changes require team consensus
- Significant changes documented as ADRs
- Version incremented with each amendment
- Migration plans required for breaking changes

**Enforcement**:
- All pull requests reviewed for constitution compliance
- CI/CD pipeline enforces automated checks
- Team members responsible for maintaining standards
- Regular retrospectives to assess constitution effectiveness

**Exceptions**:
- Must be documented with clear justification
- Require explicit approval from team lead
- Should not become patterns (address systematic issues by amending constitution)

---

**Version**: 1.0.0
**Ratified**: 2025-11-11
**Last Amended**: 2025-11-11
