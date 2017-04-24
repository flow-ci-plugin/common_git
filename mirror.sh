FLOW_LOCAL_REPO="/cache/${FLOW_PROJECT_NAME}.git"

init_local_repo(){
    flow_cmd "git clone --mirror --depth=50 --branch=$FLOW_GIT_BRANCH $FLOW_PROJECT_GIT_URL $FLOW_LOCAL_REPO" --echo --assert
}

fetch_cache(){
    if [ ! -d $FLOW_LOCAL_REPO ]; then
        init_local_repo
        return 0
    fi
    cd ${FLOW_LOCAL_REPO}
    git fetch -p origin $FLOW_GIT_BRANCH
}