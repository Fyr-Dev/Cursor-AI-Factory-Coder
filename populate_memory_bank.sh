#!/bin/bash
if [ ! -f scripts/prd.txt ]; then
    echo "PRD not found. Make sure 'scripts/prd.txt' exists."
    exit 1
fi
prd_content=$(cat scripts/prd.txt)
project_name=$(echo "$prd_content" | grep -i "Project Name" | sed 's/Project Name//I' | xargs)
project_description=$(echo "$prd_content" | grep -i "Project Description" | sed 's/Project Description//I' | xargs)
tech_stack=$(echo "$prd_content" | grep -i "Tech Stack" | sed 's/Tech Stack//I' | xargs)
echo "# Project Brief
- **Name**: $project_name
- **Description**: $project_description
- **Tech Stack**: $tech_stack
" > memory_bank/project_brief.md
echo "# Product Context
- **User Journey**:
  - [Add detailed user steps here.]
- **UX Requirements**:
  - [Mobile responsive, fast load, etc.]
" > memory_bank/product_context.md
echo "# Active Context
- **Current Focus**: Initial Development
- **Recent Changes**: None
- **Active Decisions**: Using $tech_stack stack
" > memory_bank/active_context.md
echo "# System Patterns
- **Architecture**: Modular Frontend, API-driven Backend
- **Data Flow**: [Describe briefly here]
" > memory_bank/system_patterns.md
echo "# Tech Context
- **Frontend**: [Insert frontend]
- **Backend**: [Insert backend]
- **Database**: [Insert database]
- **Constraints**: [API limits, browser constraints]
" > memory_bank/tech_context.md
echo "# Progress
## Completed
- Project Initialization
## In Progress
- Task Breakdown
## Blockers
- None
## Next Steps
- Start first major feature implementation
" > memory_bank/progress.md
echo "Memory Bank populated successfully."
