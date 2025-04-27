#!/bin/bash
echo "Enter Project Name:"
read project_name
echo "Enter Short Project Description:"
read project_description
echo "Enter Tech Stack (comma-separated, e.g., Next.js, Node.js, PostgreSQL):"
read tech_stack
mkdir $project_name
cd $project_name
mkdir scripts
cat <<EOT >> scripts/prd.txt
# Project Name
$project_name
# Project Description
$project_description
# Tech Stack
$tech_stack
# Core Features
- [Placeholder for features]
- [Placeholder for user flows]
EOT
mkdir memory_bank
touch memory_bank/project_brief.md
touch memory_bank/product_context.md
touch memory_bank/active_context.md
touch memory_bank/system_patterns.md
touch memory_bank/tech_context.md
touch memory_bank/progress.md
if ! command -v taskmaster &> /dev/null
then
    echo "Installing Taskmaster AI globally..."
    npm install -g taskmaster-ai
else
    echo "Taskmaster AI already installed."
fi
taskmaster init
taskmaster parse prd scripts/prd.txt
echo "Setup complete. Open this project in Cursor or Rucode."
