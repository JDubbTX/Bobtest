#!/bin/bash

echo () {
  # [[ "$DEBUG" ]] && builtin echo $@
  builtin echo $1 > $(dirname $0)/out.txt
}

exit_on_error() {
    exit_code=$1
    last_command=${@:2}
    if [ $exit_code -ne 0 ]; then
        >&2 builtin echo "\"${last_command}\" command failed with exit code ${exit_code}."
        CMD="CHGDTAARA DTAARA(RDGJWEIRIC/TESTERRCD (1 3)) VALUE('$exit_code')"
        cl "$CMD"
        exit $exit_code
    fi
}

echo "start"

# Set path to IBM open source packages installed in the eradani chroot container
PATH="/QOpenSys/pkgs/bin:$PATH"

echo "PATH: $PATH"

#following command is designed to fail
# Read the JSON file and extract the job names using jq
job_names=$(jq -r '.DisconnectJobs[]' /home/jweiric9/projects/testbasherrorcodes/jobs.json)

# Loop through each job name and execute the job
for job in $job_names; do
  echo "Calling job: $job"
  # Replace the echo statement with the actual command to call the job
done

exit_on_error $? "!!"

