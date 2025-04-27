#!/bin/bash
if ! command -v taskmaster &> /dev/null; then
    echo "Taskmaster not found. Install first."
    exit 1
fi
if [ ! -d tasks ]; then
    echo "No tasks found. Parse PRD first."
    exit 1
fi
echo "Analyzing task complexities..."
taskmaster analyze-complexity
sleep 5
report="scripts/complexity_report.json"
if [ ! -f $report ]; then
    echo "Complexity report missing. Aborting."
    exit 1
fi
echo "Prioritizing tasks..."
critical=()
medium=()
low=()
while IFS= read -r line; do
    task_id=$(echo "$line" | jq -r '.id')
    score=$(echo "$line" | jq -r '.complexity')
    if (( $(echo "$score > 7" | bc -l) )); then
        critical+=($task_id)
    elif (( $(echo "$score > 4" | bc -l) )); then
        medium+=($task_id)
    else
        low+=($task_id)
    fi
done < <(jq -c '.[]' $report)
mkdir -p scripts/priority_plan
echo "${critical[@]}" > scripts/priority_plan/critical.txt
echo "${medium[@]}" > scripts/priority_plan/medium.txt
echo "${low[@]}" > scripts/priority_plan/low.txt
echo "Priority Planning Done."
echo "Critical Tasks: ${#critical[@]}"
echo "Medium Tasks: ${#medium[@]}"
echo "Low Tasks: ${#low[@]}"
