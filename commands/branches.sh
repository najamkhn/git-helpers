unset -f git_currentBranch;
unset -f git_copyCurrentBranchName;
unset -f git_findMergebyBranchName;
unset -f git_revertMergeByBranchName;

function git_currentBranch {
	git branch | grep '*' | sed "s/* //" ;
}

function git_copyCurrentBranchName {
	git_currentBranch | pbcopy;
}

function git_findMergebyBranchName {
    export GITH_BRANCH_NAME=$1;
    git log --oneline --grep "Merge.*origin.*`echo $GITH_BRANCH_NAME`";
}

function git_revertMergeByBranchName {
    export GITH_BRANCH_NAME=$1;
    export GITH_REVERT_COMMIT_CMD="git log --grep \"Merge.*origin.*`echo $GITH_BRANCH_NAME`\" | head -n 1 | cut -d ' ' -f1";
    export GITH_REVERT_COMMIT=`eval $GITH_REVERT_COMMIT_CMD`
    git revert -m 1 `echo $GITH_REVERT_COMMIT`;
}

