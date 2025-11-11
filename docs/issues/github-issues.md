# GitHub Issues for Engineering Health Check Tool

Generated from: `docs/engineering-health-check-brd.md`
Date: 2025-11-11

---

## Epic 1: Team Setup

### Issue 1: [Epic 1] Team Setup: Create teams
**User Story:** US-1.1

As an administrator, I want to create teams so that I can organize engineers into their product team groups.

**Functional Requirements:**
- FR-1.1: System shall allow administrators to create teams
- FR-1.4: System shall store team membership and role information

**Acceptance Criteria:**
- [ ] Administrator can create a new team with a name
- [ ] Team information is persisted to database
- [ ] Team ID (UUID) is generated and stored
- [ ] Quorum rules can be configured for the team

**Labels:** `epic-1`, `team-setup`, `feature`, `priority-high`

---

### Issue 2: [Epic 1] Team Setup: Add team members
**User Story:** US-1.2

As an administrator, I want to add team members so that they can participate in their team's health checks.

**Functional Requirements:**
- FR-1.2: System shall allow administrators to add/remove team members
- FR-1.4: System shall store team membership and role information

**Acceptance Criteria:**
- [ ] Administrator can add users to a team
- [ ] Administrator can remove users from a team
- [ ] Team membership is persisted to database
- [ ] Users have appropriate role assignments (Team Member, Facilitator, Manager, Administrator)

**Labels:** `epic-1`, `team-setup`, `feature`, `priority-high`

---

### Issue 3: [Epic 1] Team Setup: Assign facilitators
**User Story:** US-1.3

As an administrator, I want to assign facilitators from outside the team so that all team members can participate equally.

**Functional Requirements:**
- FR-1.3: System shall allow administrators to designate facilitators (external to team)
- FR-1.4: System shall store team membership and role information

**Acceptance Criteria:**
- [ ] Administrator can designate users as facilitators
- [ ] Facilitators can be assigned to teams they are not members of
- [ ] Facilitator role is properly stored and enforced
- [ ] Facilitators have appropriate permissions (see individual votes, control sessions)

**Labels:** `epic-1`, `team-setup`, `feature`, `priority-high`

---

## Epic 2: Session Preparation

### Issue 4: [Epic 2] Session Preparation: Create a new session
**User Story:** US-2.1

As a facilitator, I want to create a new session so that my team can conduct their health check.

**Functional Requirements:**
- FR-3.1.1: Facilitator shall be able to create a new session for a team
- FR-3.1.2: System shall generate a unique session code/URL
- FR-3.1.3: System shall use the team's active prompt set for the session

**Acceptance Criteria:**
- [ ] Facilitator can create a session for a designated team
- [ ] System generates a unique session code (short alphanumeric)
- [ ] System generates a shareable session URL
- [ ] Session is initialized with the team's active prompt set
- [ ] Session metadata is stored (team ID, facilitator ID, prompt set ID, creation timestamp)

**Labels:** `epic-2`, `session-preparation`, `feature`, `priority-high`

---

### Issue 5: [Epic 2] Session Preparation: Share session code/URL
**User Story:** US-2.2

As a facilitator, I want to share a session code/URL so that team members can join easily.

**Functional Requirements:**
- FR-3.1.2: System shall generate a unique session code/URL

**Acceptance Criteria:**
- [ ] Facilitator can copy session code to clipboard
- [ ] Facilitator can copy full session URL to clipboard
- [ ] Session code is short and easy to communicate verbally (6-8 characters)
- [ ] Session URL is properly formatted and accessible
- [ ] UI provides clear "Share" functionality

**Labels:** `epic-2`, `session-preparation`, `feature`, `priority-medium`

---

### Issue 6: [Epic 2] Session Preparation: Join session via code/URL
**User Story:** US-2.3

As a team member, I want to join a session via a code/URL so that I can participate from my device.

**Functional Requirements:**
- FR-3.2.1: Team members shall be able to join session via code/URL
- FR-3.2.2: System shall display waiting room

**Acceptance Criteria:**
- [ ] Team member can enter session code on join page
- [ ] Team member can click session URL to join directly
- [ ] System validates session code and loads correct session
- [ ] Team member is redirected to waiting room upon successful join
- [ ] Invalid session codes show appropriate error messages
- [ ] Join process requires no more than 2 steps (NFR-2.3)

**Labels:** `epic-2`, `session-preparation`, `feature`, `priority-high`

---

### Issue 7: [Epic 2] Session Preparation: See who has joined the waiting room
**User Story:** US-2.4

As a facilitator, I want to see who has joined the waiting room so that I know when we have quorum.

**Functional Requirements:**
- FR-3.2.3: Facilitator shall see waiting room with participant lists
- FR-3.2.4: System shall allow teams to define quorum rules

**Acceptance Criteria:**
- [ ] Facilitator sees list of participants who have joined
- [ ] Facilitator sees list of expected team members not yet joined
- [ ] Real-time updates as participants join
- [ ] "Start Session" button is enabled when quorum requirements are met
- [ ] Clear indication of quorum status (e.g., "4 of 6 minimum participants joined")
- [ ] Participant names are clearly displayed

**Labels:** `epic-2`, `session-preparation`, `feature`, `priority-high`

---

## Epic 3: Conducting the Session

### Issue 8: [Epic 3] Conducting Session: Progress through prompts
**User Story:** US-3.1

As a facilitator, I want to progress through prompts one at a time so that I can guide the team through the discussion.

**Functional Requirements:**
- FR-3.3.1: Facilitator shall be able to navigate to next/previous prompt
- FR-3.3.1: Facilitator shall be able to display current prompt to all participants
- FR-3.3.2: System shall track session state

**Acceptance Criteria:**
- [ ] Facilitator has "Next Prompt" and "Previous Prompt" navigation controls
- [ ] Current prompt is displayed to all participants in real-time
- [ ] Session state tracks current prompt index
- [ ] Progress indicator shows position in session (e.g., "Prompt 5 of 13")
- [ ] Navigation is disabled at start (no previous) and end (no next) of session
- [ ] Prompt transitions are synchronized across all participant devices

**Labels:** `epic-3`, `conducting-session`, `feature`, `priority-high`

---

### Issue 9: [Epic 3] Conducting Session: See current prompt and thinking points
**User Story:** US-3.2

As a team member, I want to see the current prompt and thinking points so that I can consider my vote thoughtfully.

**Functional Requirements:**
- FR-3.4.1: When voting opens, participants shall see prompt text and sub-prompts

**Acceptance Criteria:**
- [ ] Current prompt text is clearly displayed
- [ ] Sub-prompts (thinking points) are visible
- [ ] Voting type is indicated (finger vote 1-4 or Roman vote)
- [ ] UI is optimized for mobile viewing
- [ ] Text is legible on minimum 360px width devices (NFR-2.1)
- [ ] Thinking points can be collapsed/expanded for better readability

**Labels:** `epic-3`, `conducting-session`, `feature`, `priority-high`

---

### Issue 10: [Epic 3] Conducting Session: Vote anonymously
**User Story:** US-3.3

As a team member, I want to vote anonymously so that I can provide honest feedback without fear of judgment.

**Functional Requirements:**
- FR-3.4.2-3.4.5: Voting process with readiness and countdown
- FR-3.4.8: Participant view shall show only aggregates (anonymous)
- FR-7.2: System shall prevent team members from seeing other's individual votes

**Acceptance Criteria:**
- [ ] Team member can indicate "Ready to vote"
- [ ] System waits until all participants are ready
- [ ] Countdown displays when all ready (e.g., "1-2-3-vote")
- [ ] Team member casts vote during countdown
- [ ] Individual votes are never shown to other team members
- [ ] Only aggregate results are displayed to participants
- [ ] Individual vote data is encrypted at rest (NFR-4.2)
- [ ] Voting interface is operable with one hand on mobile (NFR-2.2)

**Labels:** `epic-3`, `conducting-session`, `feature`, `priority-high`, `security`

---

### Issue 11: [Epic 3] Conducting Session: See aggregate results in real-time
**User Story:** US-3.4

As a team member, I want to see aggregate results in real-time so that I understand team sentiment.

**Functional Requirements:**
- FR-3.4.5: System shall immediately display real-time aggregate as graduated progress bar
- FR-3.4.6-3.4.7: Progress bar specifications for finger and Roman votes
- NFR-1.2: Vote aggregation shall display within 500ms

**Acceptance Criteria:**
- [ ] Aggregate results display immediately after voting closes
- [ ] For finger votes (1-4): Distribution bar, average score, total votes
- [ ] For Roman votes: Count of up/down/sideways, percentage distribution, total votes
- [ ] Graduated progress bar provides clear visual representation
- [ ] Results appear within 500ms of last vote cast
- [ ] Animated transition for results display

**Labels:** `epic-3`, `conducting-session`, `feature`, `priority-high`, `performance`

---

### Issue 12: [Epic 3] Conducting Session: See individual votes (facilitator)
**User Story:** US-3.5

As a facilitator, I want to see individual votes so that I can identify outliers for discussion.

**Functional Requirements:**
- FR-3.4.9: Facilitator view shall show individual votes with names and outlier indicators
- FR-7.1: Facilitator role enforcement
- NFR-4.4: System shall log all access to individual vote data

**Acceptance Criteria:**
- [ ] Facilitator view displays individual votes with participant names
- [ ] Aggregate visualization is also shown to facilitator
- [ ] Outliers are visually highlighted (>1.5 std dev from mean, or configurable threshold)
- [ ] Individual votes are displayed in facilitator-only panel
- [ ] Access to individual vote data is logged for audit purposes
- [ ] Facilitator can toggle between individual and aggregate views

**Labels:** `epic-3`, `conducting-session`, `feature`, `priority-high`, `security`

---

### Issue 13: [Epic 3] Conducting Session: Capture notes during discussion
**User Story:** US-3.6

As a facilitator, I want to capture notes during discussion so that I can record insights without disrupting flow.

**Functional Requirements:**
- FR-3.5.1: Facilitator shall be able to add free-form notes to any prompt
- FR-3.5.2: System shall timestamp all notes

**Acceptance Criteria:**
- [ ] Facilitator has a notes panel/text area for current prompt
- [ ] Notes can be added in real-time during discussion
- [ ] All notes are automatically timestamped
- [ ] Notes are persisted immediately to prevent data loss
- [ ] Notes are associated with the specific prompt
- [ ] Notes are included in session summary

**Labels:** `epic-3`, `conducting-session`, `feature`, `priority-medium`

---

### Issue 14: [Epic 3] Conducting Session: Capture action items
**User Story:** US-3.7

As a facilitator, I want to capture action items so that the team remembers follow-up tasks.

**Functional Requirements:**
- FR-4.1: Facilitator shall be able to capture action items with description, assigned to, related prompt
- FR-4.2: System shall display action items in session summary

**Acceptance Criteria:**
- [ ] Facilitator can add action items during session
- [ ] Action item includes: description (required), assigned to (optional), related prompt (optional)
- [ ] Action items are timestamped
- [ ] Multiple action items can be added per session
- [ ] Action items are persisted immediately
- [ ] Action items appear in session summary
- [ ] Facilitator can edit/delete action items before session ends

**Labels:** `epic-3`, `conducting-session`, `feature`, `priority-medium`

---

## Epic 4: Understanding Trends

### Issue 15: [Epic 4] Understanding Trends: See historical trends during session
**User Story:** US-4.1

As a facilitator, I want to see historical trends during the session so that I can provide context to the team.

**Functional Requirements:**
- FR-6.2: System shall provide historical view with line charts and trend indicators
- FR-6.5: Facilitators shall see individual vote history
- NFR-1.3: Historical data queries shall return within 2 seconds

**Acceptance Criteria:**
- [ ] Facilitator can view historical data for current prompt during session
- [ ] Line chart shows average scores over time for the prompt
- [ ] Trend indicators show improving/steady/declining status
- [ ] Previous session comparison is available
- [ ] Historical query returns within 2 seconds
- [ ] Historical panel is accessible without disrupting current voting

**Labels:** `epic-4`, `trends`, `feature`, `priority-medium`, `performance`

---

### Issue 16: [Epic 4] Understanding Trends: See how scores have changed over time
**User Story:** US-4.2

As a team member, I want to see how our scores have changed over time so that I can understand if we're improving.

**Functional Requirements:**
- FR-6.2: Historical view with line charts
- FR-6.4: Participants shall see only aggregate historical data

**Acceptance Criteria:**
- [ ] Team member can access historical trends view
- [ ] Line chart displays average scores over time per prompt
- [ ] Only aggregate data is shown (no individual votes)
- [ ] Date range filtering is available
- [ ] Trend indicators show direction (improving/steady/declining)
- [ ] Moving averages are calculated and displayed (3-session default)

**Labels:** `epic-4`, `trends`, `feature`, `priority-medium`

---

### Issue 17: [Epic 4] Understanding Trends: View trends across multiple teams (Manager)
**User Story:** US-4.3

As an engineering manager, I want to view trends across multiple teams so that I can identify systemic issues.

**Functional Requirements:**
- FR-7.1: Manager role can view all teams' historical data
- FR-6.2-6.3: Historical views with trend analysis

**Acceptance Criteria:**
- [ ] Manager can access multi-team historical dashboard
- [ ] Team selector allows filtering by specific teams or viewing all
- [ ] Trends can be compared across teams
- [ ] Manager can see both aggregate and individual vote history
- [ ] Significant changes are highlighted (>0.5 change threshold, configurable)
- [ ] Cross-team insights help identify systemic issues

**Labels:** `epic-4`, `trends`, `feature`, `priority-low`

---

### Issue 18: [Epic 4] Understanding Trends: Export session summaries
**User Story:** US-4.4

As a facilitator, I want to export session summaries so that I can share results with stakeholders.

**Functional Requirements:**
- FR-5.1: System shall generate session summary
- FR-5.2: Export as Markdown and PDF
- FR-5.3: Share summary URL

**Acceptance Criteria:**
- [ ] Session summary includes: date/time, duration, participants, vote results, notes, action items, comparison to previous session
- [ ] Summary can be exported as Markdown format
- [ ] Summary can be exported as PDF format
- [ ] Summary has a shareable URL
- [ ] Summary is accessible after session ends
- [ ] Export buttons are clearly visible and functional

**Labels:** `epic-4`, `trends`, `feature`, `priority-medium`

---

## Epic 5: Customization

### Issue 19: [Epic 5] Customization: Customize prompt set
**User Story:** US-5.1

As a team lead, I want to customize our prompt set so that the health check addresses our specific concerns.

**Functional Requirements:**
- FR-2.3: System shall allow teams to customize prompt sets
- FR-2.4: System shall maintain prompt history (versioning)

**Acceptance Criteria:**
- [ ] Team lead can access prompt management interface
- [ ] Team lead can activate/deactivate prompts
- [ ] Team lead can modify existing prompt text and sub-prompts
- [ ] Team lead can reorder prompts
- [ ] Changes are versioned (history maintained)
- [ ] Active prompt set is used for new sessions
- [ ] Changes do not affect in-progress sessions

**Labels:** `epic-5`, `customization`, `feature`, `priority-low`

---

### Issue 20: [Epic 5] Customization: Create custom prompts
**User Story:** US-5.2

As a team lead, I want to create custom prompts so that we can track team-specific metrics.

**Functional Requirements:**
- FR-2.1: Abstract prompt model with attributes
- FR-2.3: Teams can create custom prompts

**Acceptance Criteria:**
- [ ] Team lead can create new custom prompts
- [ ] Custom prompt includes: prompt text, voting type (finger 1-4 or Roman), category, sub-prompts, active status
- [ ] Custom prompts can be added to team's prompt set
- [ ] Custom prompts support both voting types
- [ ] Display order can be set for custom prompts
- [ ] Custom prompts persist and can be reused across sessions

**Labels:** `epic-5`, `customization`, `feature`, `priority-low`

---

### Issue 21: [Epic 5] Customization: Start with standard prompts
**User Story:** US-5.3

As a team, we want to start with standard prompts so that we don't have to create everything from scratch.

**Functional Requirements:**
- FR-2.2: System shall include default prompt set matching standard Engineering Health Check

**Acceptance Criteria:**
- [ ] Default prompt set is provided for all new teams
- [ ] Default set includes 13 prompts across 4 categories:
  - Developing and Changing Code (4 prompts)
  - Automated Development Tests (5 prompts)
  - Others (3 prompts)
  - Overall (1 prompt)
- [ ] Default prompts have pre-defined sub-prompts (thinking points)
- [ ] Teams can use default set without modification
- [ ] Default set matches the standard Engineering Health Check format from BRD

**Labels:** `epic-5`, `customization`, `feature`, `priority-high`

---

## Additional Technical Issues

### Issue 22: [Infrastructure] WebSocket real-time voting system
**Technical Requirement**

Implement WebSocket infrastructure for real-time voting and session updates.

**Functional Requirements:**
- NFR-3.1: Maintain real-time connection with automatic reconnection
- NFR-3.2: Persist votes immediately upon submission
- NFR-3.3: Graceful recovery from network interruptions

**Acceptance Criteria:**
- [ ] WebSocket server implemented
- [ ] WebSocket client connection management
- [ ] Automatic reconnection on disconnect
- [ ] Vote buffering during network issues
- [ ] Real-time sync of session state (prompts, voting status)
- [ ] WebSocket security (authentication, authorization)

**Labels:** `infrastructure`, `technical`, `priority-high`, `performance`

---

### Issue 23: [Infrastructure] Database schema and migrations
**Technical Requirement**

Implement database schema based on data model in BRD with migration support.

**Entities:**
- TEAM, USER, PROMPT_SET, PROMPT, SESSION, VOTE, NOTE, ACTION_ITEM

**Acceptance Criteria:**
- [ ] PostgreSQL schema implemented
- [ ] All entities from data model created with proper relationships
- [ ] UUIDs used for primary keys
- [ ] Timestamps for audit trail
- [ ] Migration framework set up (e.g., Prisma, TypeORM migrations)
- [ ] Seed data for default prompt set
- [ ] Indexes for performance on common queries

**Labels:** `infrastructure`, `database`, `technical`, `priority-high`

---

### Issue 24: [Infrastructure] Authentication and authorization
**Technical Requirement**

Implement role-based access control (RBAC) with simple authentication.

**Functional Requirements:**
- FR-7.1: Role-based access enforcement
- NFR-4.1: TLS 1.3+ encryption
- NFR-4.3: Session timeout (4 hours default)

**Roles:**
- Administrator, Manager, Facilitator, Team Member

**Acceptance Criteria:**
- [ ] Simple username/password authentication
- [ ] Session management with configurable timeout
- [ ] Role-based middleware for route protection
- [ ] TLS encryption enforced
- [ ] Password hashing (bcrypt or similar)
- [ ] JWT or session-based authentication
- [ ] Logout functionality

**Labels:** `infrastructure`, `security`, `technical`, `priority-high`

---

### Issue 25: [Infrastructure] Mobile-responsive UI foundation
**Technical Requirement**

Establish responsive design foundation with Next.js and React.

**Functional Requirements:**
- NFR-2.1: Responsive and functional on 360px+ width
- NFR-2.2: One-hand mobile operation
- NFR-2.4: Clear visual feedback for state changes

**Acceptance Criteria:**
- [ ] Next.js project initialized with TypeScript
- [ ] UI component library selected and configured (e.g., Tailwind CSS, Material-UI)
- [ ] Mobile-first responsive design system
- [ ] Touch-friendly UI components (44x44px minimum tap targets)
- [ ] Design system documentation
- [ ] Accessibility considerations (WCAG 2.1 AA)

**Labels:** `infrastructure`, `ui`, `technical`, `priority-high`

---

## Summary

**Total Issues:** 25
- Epic 1 (Team Setup): 3 issues
- Epic 2 (Session Preparation): 4 issues
- Epic 3 (Conducting Session): 7 issues
- Epic 4 (Understanding Trends): 4 issues
- Epic 5 (Customization): 3 issues
- Infrastructure/Technical: 4 issues

**Priority Breakdown:**
- High Priority: 16 issues
- Medium Priority: 6 issues
- Low Priority: 3 issues

**Labels Used:**
- `epic-1`, `epic-2`, `epic-3`, `epic-4`, `epic-5`
- `team-setup`, `session-preparation`, `conducting-session`, `trends`, `customization`
- `feature`, `technical`, `infrastructure`
- `priority-high`, `priority-medium`, `priority-low`
- `security`, `performance`, `database`, `ui`
