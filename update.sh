echo "=> Pulling latest changes..."
git pull

echo "=> Updating submodules..."
git submodule update --remote
git submodule status

echo "=> Rebuilding docker images and running..."
bash build.sh -l
