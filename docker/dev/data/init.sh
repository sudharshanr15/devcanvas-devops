workdir="/var/www/devcanvas/"

cd $workdir
if ! [ -d "$workdir/.git" ]; then
    echo "Cloning..."
    git clone https://github.com/sudharshanr15/devcanvas.git "$workdir"
else
    echo "Repository found"
fi

if ! [ -f "$workdir/.env" ]; then
    cp .env.example .env
fi
