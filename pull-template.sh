if ! git remote get-url template &> /dev/null; then
    git remote add template git@github.com:mattslaney/build-containers.git
fi
git fetch template
git merge template/main --allow-unrelated-histories

