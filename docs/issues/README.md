# GitHub Issues for Engineering Health Check

This directory contains generated GitHub issues from the BRD (Business Requirements Document).

## Files

- **github-issues.md** - Detailed markdown with all 25 issues including full descriptions, acceptance criteria, and labels
- **github-issues.csv** - CSV format for bulk import into GitHub

## Issue Summary

**Total Issues:** 25

### By Epic:
- **Epic 1 - Team Setup:** 3 issues
- **Epic 2 - Session Preparation:** 4 issues
- **Epic 3 - Conducting Session:** 7 issues
- **Epic 4 - Understanding Trends:** 4 issues
- **Epic 5 - Customization:** 3 issues
- **Infrastructure/Technical:** 4 issues

### By Priority:
- **High Priority:** 16 issues
- **Medium Priority:** 6 issues
- **Low Priority:** 3 issues

## How to Create Issues in GitHub

### Option 1: Manual Creation

1. Open `github-issues.md`
2. Copy each issue's content
3. Go to your GitHub repository → Issues → New Issue
4. Paste the title and body
5. Add the labels listed for that issue
6. Click "Submit new issue"

### Option 2: GitHub CLI (Batch Creation)

If you have GitHub CLI (`gh`) installed and authenticated:

```bash
# Navigate to repository root
cd /home/user/dipstick

# Create a script to batch-create issues
cat > create-issues.sh << 'EOF'
#!/bin/bash

# Issue 1
gh issue create \
  --title "[Epic 1] Team Setup: Create teams" \
  --body-file <(sed -n '/^### Issue 1:/,/^---$/p' docs/issues/github-issues.md | tail -n +2 | head -n -1) \
  --label "epic-1,team-setup,feature,priority-high"

# Repeat for all 25 issues...
# (Full script can be generated from the markdown file)
EOF

chmod +x create-issues.sh
./create-issues.sh
```

### Option 3: CSV Import (GitHub Projects)

1. Go to your GitHub repository
2. Navigate to Projects tab
3. Create a new Project (if needed)
4. Import the CSV file `github-issues.csv`
5. Map columns: title → Title, body → Description, labels → Labels
6. GitHub will create issues from the CSV data

### Option 4: GitHub API (Programmatic)

Use the GitHub REST API to programmatically create issues:

```bash
# Example for Issue 1
curl -X POST \
  -H "Authorization: token YOUR_GITHUB_TOKEN" \
  -H "Accept: application/vnd.github.v3+json" \
  https://api.github.com/repos/OWNER/REPO/issues \
  -d '{
    "title": "[Epic 1] Team Setup: Create teams",
    "body": "...",
    "labels": ["epic-1", "team-setup", "feature", "priority-high"]
  }'
```

## Labels to Create First

Before importing issues, create these labels in your repository:

### Epic Labels
- `epic-1` - Team Setup
- `epic-2` - Session Preparation
- `epic-3` - Conducting Session
- `epic-4` - Understanding Trends
- `epic-5` - Customization

### Feature Area Labels
- `team-setup`
- `session-preparation`
- `conducting-session`
- `trends`
- `customization`
- `infrastructure`

### Type Labels
- `feature` - New feature
- `technical` - Technical work
- `database` - Database related
- `security` - Security related
- `ui` - UI/UX work

### Priority Labels
- `priority-high` - High priority
- `priority-medium` - Medium priority
- `priority-low` - Low priority

### Special Labels
- `performance` - Performance related
- `security` - Security considerations

## Constitution Compliance

All issues should be implemented following the Dipstick Constitution (`.specify/memory/constitution.md`):

- ✅ TypeScript-only with strict mode
- ✅ Test-first development (88% coverage minimum)
- ✅ Cloud-native patterns
- ✅ Next.js/React best practices
- ✅ Security awareness
- ✅ Comprehensive documentation

## Next Steps

1. **Review Issues:** Review all 25 issues in `github-issues.md` for accuracy
2. **Create Labels:** Set up all labels in GitHub repository
3. **Import Issues:** Use one of the methods above to create issues
4. **Prioritize:** Organize issues into project milestones or sprints
5. **Start Development:** Begin with high-priority Epic 1 and Epic 2 issues

## Development Order Recommendation

### Phase 1: Foundation (Epic 1 + Infrastructure)
1. Issue 23: Database schema
2. Issue 24: Authentication & authorization
3. Issue 25: Mobile-responsive UI foundation
4. Issue 1-3: Team management

### Phase 2: Core Session Flow (Epic 2 + Epic 3)
5. Issue 22: WebSocket infrastructure
6. Issue 4-7: Session preparation
7. Issue 8-12: Core voting functionality

### Phase 3: Session Enhancements (Epic 3 continued)
8. Issue 13-14: Notes and action items

### Phase 4: Historical Data (Epic 4)
9. Issue 15-18: Trends and reporting

### Phase 5: Customization (Epic 5)
10. Issue 19-21: Prompt customization

## Source

Generated from: `docs/engineering-health-check-brd.md`
Date: 2025-11-11
Tool: Claude Code
