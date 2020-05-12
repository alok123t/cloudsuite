# @authors: Somya Arora, Arash Pourhabibi
#!/bin/bash
# Figure out the modified files in this push command or pull request
modified_files=$(git --no-pager diff --name-only ${TRAVIS_COMMIT_RANGE})
# Get benchmark name and tag name for this build
benchmark_name=${DH_REPO#*/}
tag_name=$IMG_TAG
if [ -z "$modified_files" ]; then
    echo "No Modifications required."
else
    echo "Checking against modified files"
fi
# Find out whether the files related with the current build were modified or not
if (grep -q "$benchmark_name/$tag_name" <<<$modified_files) ||
    (grep -q "$benchmark_name" <<<$modified_files && [ $tag_name = "latest" ]) ||
    (grep -q "travis.sh" <<<$modified_files) ||
    (grep -q ".travis.yml" <<<$modified_files); then
    # if modified, then rebuild their docker image
    docker buildx build --platform linux/amd64,linux/arm64,linux/riscv64 -t $DH_REPO:$IMG_TAG $DF_PATH
    echo "Buildx completed"
    # make sure build was successful
    result=$?
    echo $result
    if [ $result != "0" ]; then
        return 1
    fi
    echo "Check PR"
    # Push if this file was triggerred by a push command (not a pull request)
    if [ "${TRAVIS_PULL_REQUEST}" = "false" ] && [ "${TRAVIS_BRANCH}" = "master" ]; then
        docker login -u="$DOCKER_USER" -p="$DOCKER_PASS"
        # Pushing needs login, test if login was successful
        result=$?
        if [ $result != "0" ]; then
            return 1
        fi
        # push the docker image
        docker buildx build --platform linux/amd64,linux/arm64,linux/riscv64 -t $DH_REPO:$IMG_TAG --push $DF_PATH
        result=$?
        if [ $result != "0" ]; then
            return 1
        fi
    else
        echo "No push command executed"
    fi
    echo "Exit"
# if no file related to this image was modified
else
    echo "No Modifications to this image"
fi
