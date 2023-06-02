apt-get install software-properties-common -y
echo | add-apt-repository ppa:jonathonf/ffmpeg-4
apt-get update
apt-get install ffmpeg -y
ffmpeg -version
