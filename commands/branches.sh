function git_currentBranch {
	git branch | grep '*' | sed "s/* //" ;
}

function git_copyCurrentBranchName {
	git_currentBranch | pbcopy;
}

function git_findMergebyBranchName {
    export GITH_BRANCH_NAME=$1;
    git log --grep "Merge.*origin.*`echo $GITH_BRANCH_NAME`";
}

function git_revertMergeByBranchName(){
    export GITH_BRANCH_NAME=$1;
    export GITH_REVERT_COMMIT=git log --grep "Merge.*origin.*`echo $GITH_BRANCH_NAME`" | head -n 1 | cut -d ' ' -f1;
    git revert `echo GITH_REVERT_COMMIT`;
}

